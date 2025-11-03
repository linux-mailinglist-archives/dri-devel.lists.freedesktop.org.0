Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C00C2C886
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940FA10E410;
	Mon,  3 Nov 2025 15:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="RH10dIKF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0B410E209
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:01:23 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-591c98ebe90so4161294e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 07:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1762182082; x=1762786882; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFTnq7/AvjAJd1O0uQ5fE6zbW25tzv8iQUb4vGr8AYI=;
 b=RH10dIKFURh4x9mMXeOcZnTIg+mVmYGmkWSmq9jcrGP3GmQsGoePlMU9IydnJILxlo
 J8s2FuvlVo2fnIpLUPQd116cLvjewiVBd0ZBBh64P/oWxR9wvrzOVRtRHsv1AGuaxN3l
 KTys5wM1rveiuQoZ6ATtZIfvfmP4dvFR88dBOdCL0wjJOwIQkdZuvkxdiyZw24Joy8Au
 gANhHp4erR5D/wuR+zP2z8PcOtGtw+HKp6eVqxSMa4FKPCwqXasK3HS70jDhoS8BH1RH
 ECgJLCp/MFQjk14zyMmoRmb1NCh+IMH2oOUIIBU3pWacXAhzkv9Xk3GNVvI1TPHcXbL+
 o9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762182082; x=1762786882;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wFTnq7/AvjAJd1O0uQ5fE6zbW25tzv8iQUb4vGr8AYI=;
 b=oBk9w04IfXVXpmvU9ZZyaIrr+x/kLBYPYTC6TAgxUntojksBt1OGgNtM2Uvd+3RKpB
 MH8GHkLrjfKF10IYiWivOyl1yJMx50/Lu+c7g/10YvqXM5K2whDQnvc7k5Hk6/PBvDOC
 imHdfEt/NtgFKjbnoZ9bXEaqxDMD6aUMCwehs2ASTHxUp23rPo+RCF/LV0mVYggG08GK
 9/NpS9aCQlHzbFIFbbMU7/BA5RumSbwfV9OuJ7kvfMt6VwZLCwLhkvdyiGf49AH0q7Ip
 8szRXFX+nFBKK4dZXU+PidrsAPE5HlO96+uVmNGVKCXCU2aW1PgoesC3EaDMdAA5EcQO
 qoHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOBYFoyf0eMY+6lDitTQYvWVRS2tq3SNx9HxiB3QQRQB2YlO6WeqRwNFr5ZCfeEuu6Y7hVkAJxHM8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvXum7EkCU6yHZ31cr9FEapThjjA79DQPv+IsJm6JEwK+Kk6I9
 nsSC33g6TXUonR7s9YDrfjlUzfk+0D3Q0Cv7ykLEl0887o4SSSc/PbLi2iUY3kIdS79LnOXeSgL
 K6E4f5Ho7lFBFp4Q6P5GDIt0Nt9X3Iq8QQh2qeOfLNw==
X-Gm-Gg: ASbGncs8tVGe5IgmCkVJR0fNy9WLsX1Ni3UHR3mX9cqj5JThCBq/vGKweMx9xldXHye
 VPu+Hre6Wxzq1zmtcn/CFK/Egnw5iscR67Cr3nPbi8r+w1zJ834EMubfAvoYhGgO8jz1AnsiLsf
 48kTNnLEOd2cJUfoGLkMWxBD1rz1iIjfuN7iLDv2tcWEWKrdbEIVQQd/Am26xiUg3hkF3sEGxjm
 7fiOBhMafwjDYuja9hNfaitBWfYAebVp6mQtsArH2tKwm8g/SfPyjRI1Va/w+lrnsiL6QmOgwZf
 nHmxRBJlwfBqwqBH7+2Uly9UWnaS
X-Google-Smtp-Source: AGHT+IFa4Mg43fDyhq8XGqcAaXzT3DThyrNii6w4o7OGlqUmCCShlNd2QaVTebvbSElp7vVfURXPMK55scLnEN7av9g=
X-Received: by 2002:ac2:4e0f:0:b0:55f:7328:f6ae with SMTP id
 2adb3069b0e04-5941d554d76mr5114757e87.51.1762182081490; Mon, 03 Nov 2025
 07:01:21 -0800 (PST)
MIME-Version: 1.0
References: <20251030161011.282924-1-marco.crivellari@suse.com>
 <20251030161011.282924-4-marco.crivellari@suse.com>
 <690b3fd0-20a1-4245-8fc4-4e8b40695c98@amd.com>
 <CAAofZF4V7gN=AqgLwcva+zhJyROYfSjzJ2uLxoNeS2KLuytW9Q@mail.gmail.com>
 <42c631c7-7773-b029-6d59-a54112363a71@amd.com>
In-Reply-To: <42c631c7-7773-b029-6d59-a54112363a71@amd.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 3 Nov 2025 16:01:09 +0100
X-Gm-Features: AWmQ_blJWZ1gR4hPVHrfeQXQvGwYLwKy_C2JeMo72mgp-bqvi56gDubAhgPoPh4
Message-ID: <CAAofZF4Q6MAg0ob4nJEGXkHd0KnDPgOsATcguER6mAmD7CD6Vg@mail.gmail.com>
Subject: Re: [PATCH 3/4] amd/amdkfd: WQ_PERCPU added to alloc_workqueue users
To: Philip Yang <yangp@amd.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Tejun Heo <tj@kernel.org>, 
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, "Yang, Philip" <Philip.Yang@amd.com>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>
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

On Fri, Oct 31, 2025 at 2:12=E2=80=AFPM Philip Yang <yangp@amd.com> wrote:
> Hi,
>
> WQ_UNBOUND is more appropriate here, to execute the KFD release work imme=
diately as long as CPU resource is available, not specific to the CPU that =
kfd_unref_process the last process refcount.

Hi,

I will do what you suggest.

Thank you!

--=20

Marco Crivellari

L3 Support Engineer, Technology & Product
