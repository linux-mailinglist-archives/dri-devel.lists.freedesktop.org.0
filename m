Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57151CE9463
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 10:56:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707C810E042;
	Tue, 30 Dec 2025 09:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="bvhEU+CU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D149C10E042
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 09:56:26 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-59581e32163so11360072e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 01:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1767088585; x=1767693385; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=;
 b=bvhEU+CU5jMsLUFhjo3qTKds4Vr7t9yxuGdL1eiKbgu53c9QXTRwushlVUasgSnVxu
 BSXBmVZxd5MU6a3XpJeU02Bf5sOTVpJFsTfUbV+Dn0J6OO53AW5pyPi4ZovfitZ8cj5W
 8pi6aAle4ZkgJQUL4g+7z0/Ul5xcplscDzOcFmcOEwQ1QiMMpSnsIZvyk0O8Cxlf/TnA
 9h3MmP64ghTHIT4EKoT1XyaBxKRvHEiVeuDga7fGJ/lPrTbjG1H+O7WUNhnrZBUy02Cj
 ckC7rNPZSsv5gT+9QLyEGVbk+ychaeEB5kd+VlRvaBqpnM/ts8aYwxLtuJ//PpsBm5mC
 A7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767088585; x=1767693385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9CSA4RsITRmIPzLrBNLCxMgAc0tHKBMj5y/0Ba5xFWg=;
 b=IggxnXRblLliyecr1Qa6MtiYbssS2DWg16epINyTn6zbV7lSZbDxkVAQwKYBObGt42
 jgRSJ/YyeShUfAMWXIK9PwIjq4QMFEy0Z/qYgA5ZKn3fJWyBkGaxVvWjFtf3//cbscAi
 L9a6nG4dtBSgn+It9+Yw3jYZs3w/BP968HyVTFPXG7C/HVQy2l59HT8pRLpz5qscKVNT
 MHXjllZgccMf47g6LuAy18octusPqyzRT8oKCzKKSOKOZA+N6ii4etlqqUZwaKq2OYxh
 uO/QRgJpR7adrCUnLoh2PBF4hF7vaaCjoNsxNdDyB9a0+oGfn/QbyDHqyBb9dqZxYrBC
 0MWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/ml8bTBy0Gj+CQ+BYInxSjJnU2UHsNqnkAFQJc+v3rVdOtc/a3OU78mLgEf6Sz4pCR/0GksAJYEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnO0NE0BoefRll2Kt+vmdpafqT8NgLU63eDWt4ISytTpDEPSsP
 4dd7zqSQrzrypdP6DU58tld/dNo1o9+NHj1UpC+aGl5raeVfoCQMthuGlFXGd8CCztYVy1UVkFu
 d0DuLk9o998+lGKO6MNaOa2PcFL9jQgr0vSuzhhSlOQ==
X-Gm-Gg: AY/fxX6Lo0kJInObOEuhEIsdDBWwj/OempWj1v5fvMTlfmZb4utRGCrfODEhDQE/Zjj
 8/vlhWY8a1R3lWz1aj+MZeD6HeQl3zE2XXet3xhNgVjtTHLkF2oo9r1MBPr9H85t2ogEXHAIrGM
 l4KDCOjA8md/4o8RMvm0CiN/GChWf3X+eoP9CBfsdm2r1Mto/r2H9KQQgSEVH5UXRpgvfu3OZXd
 jQsYAGY8aeWcBSXBKeUo3lFsApAqPnHWcanQkXkPlgXQVPl65mMMQMjfZFLqufK+3jCWLWCPtbq
 8Xvg5iYMyEpM1/UY57DNnkMBazOO
X-Google-Smtp-Source: AGHT+IGF2+DUuPOWMyxl/m/YE1J+MpsN9z3qB0Mfg4V4PK/uMaSMEjg5JdfAVQd/YzIJO09H45JgrMZiuh+pgS8W7s0=
X-Received: by 2002:a05:6512:110a:b0:595:909d:1af6 with SMTP id
 2adb3069b0e04-59a17d579dcmr10690623e87.28.1767088585063; Tue, 30 Dec 2025
 01:56:25 -0800 (PST)
MIME-Version: 1.0
References: <20251104112923.143408-1-marco.crivellari@suse.com>
 <CAAofZF4OJi5eEfjhE12RWi6wDU+A9Rghsd2721SxZR4AC08sYg@mail.gmail.com>
 <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
In-Reply-To: <CAAQKjZPVi1KHuS4p6G2uAeKMAg=PEbECj7DHW7OYNYLG-S9hmQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 30 Dec 2025 10:56:13 +0100
X-Gm-Features: AQt7F2oh3vqm2C9AigTf7qyt5vRvEM0_ckvr_DiAVWkRHeGhyvYiTBn7mc558-8
Message-ID: <CAAofZF5Fi7x0JyyNm=pSh9H=qp7qCH1xawB5Ad6+=-xzwre+Ew@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: hdmi: replace use of system_wq with
 system_percpu_wq
To: Inki Dae <daeinki@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 30, 2025 at 6:48=E2=80=AFAM Inki Dae <daeinki@gmail.com> wrote:
>
> Hi,
>
> Sorry for late reply. Merged.

Hi,

No problem, thank you!

--=20

Marco Crivellari

L3 Support Engineer
