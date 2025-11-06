Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD942C3932B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 07:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9395C10E097;
	Thu,  6 Nov 2025 06:02:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E841E10E097
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 06:01:59 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59390875930so833429e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 22:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762408916; x=1763013716;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/EMy/K4xOqVd/TJc3X5qTwSIeGII2QmhmiESeAGTuis=;
 b=ASXuFESk8whGGP2xC/dPoGvv66xXACwjm5cirfOSsHOeAskNOLZ6Hh3aF33nZPmoXz
 MHf/EEW74hwmD0ex9XdNv0lPmCj99bl0YnZPv/E+FDnlUUj0A9Wm2UJHWBNQAG6LFv5+
 3e2pHlgnqke+MZasTAd4l3ssthgdre7lSOs2A7Q6taeuqsaSAa4/GBtx+618r7E4vzgp
 czQlpKWG9ecBwwXGj7Dyf083qdqLWLo1V2czDzjhnyQtPMuGqbiDdkgdtlgMSFOgi4A6
 lLpy9CgFWGQyrDC7/NWHhctX7+fmZDmXZXMTpWbVjJJVSsWH92yqP7yQyq9KDoAyx8Ok
 qVsg==
X-Gm-Message-State: AOJu0Yxc5gk+4aAXJ+nXL5IozMOGex7sF7IJarT8wSEMyihcjuRM40T+
 /tUKWRYfqoi+FIBu+Uy4RWr/khnYjvDR/21Kscg4CXQPyqx5Q+27iC2EhOhwRCJN
X-Gm-Gg: ASbGncssf6le2hPSjdiU+tlqnV8WQ4Ka9c3fn0QWOX4RRBDHcKKtCcAYcIShpP3TRUu
 oV1/tfcOrdOBLYQmfNg9uFTn8k9EFZA/sLU2mp908rs0F3iZrahnbPhCqVc/hlD2skLcrwqVG9j
 ep35BqvU5PIXLx29k1ZCammfNmXTWCNn0e6vWnzsZA7KncL46TA+o3seFOpEy+5b02MbNF1qq4H
 LsHUp2Z/5quNZpDmulx7vl03DRGig737dqBZ+X2XqoHSwIVgBqydQq5fwcbFZVMmOCOsPB5yVfV
 ntiQzfPe51cCZjNICxXu3vNk90t8To9YFV4/IRXGenAHDddi/rtF1M1jA5vrJfOUYZSkae3+EL4
 RBrRYB3vNeHKWEDM+3dyiZ1D2t9VIvEkVer1L5eTCxGLRl+JKRlnarTUcEs/EZYu26Q13XbdydV
 oskot/T/OO8UVz6mZccIXHIFEM5doASdD2Qh9eabv/th8=
X-Google-Smtp-Source: AGHT+IEyP3NAfQgnp1rpnykVDQRJ1EPYeDoEffRmGqmqWbVs4dlpQYYuZOah9y6h5sJlAlaL2BFqdw==
X-Received: by 2002:a05:6512:3b2a:b0:594:34c4:a325 with SMTP id
 2adb3069b0e04-5943d7d6430mr1844077e87.46.1762408915426; 
 Wed, 05 Nov 2025 22:01:55 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
 [209.85.208.180]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5944a019edbsm440318e87.29.2025.11.05.22.01.54
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 22:01:54 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-37a2dcc52aeso5486381fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 22:01:54 -0800 (PST)
X-Received: by 2002:a05:651c:908:b0:37a:2d72:6119 with SMTP id
 38308e7fff4ca-37a51406a51mr16362171fa.21.1762408914469; Wed, 05 Nov 2025
 22:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20250704154149.3464461-1-paulk@sys-base.io>
 <aKhFPRP8ILNkKAvy@shepard>
In-Reply-To: <aKhFPRP8ILNkKAvy@shepard>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 6 Nov 2025 14:01:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
X-Gm-Features: AWmQ_blhZqLqx77LWLcKS7_dqP43aeZsGzE4L69w_GDVHcl80KjzuIFGb-55rnE
Message-ID: <CAGb2v66=Ppqw+_fpAsRYd_4OBOhbHkk7RetfEXbYmvQ_+hoe7g@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and
 indentation
To: Paul Kocialkowski <paulk@sys-base.io>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Samuel Holland <samuel@sholland.org>
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 22, 2025 at 6:24=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi,
>
> On Fri 04 Jul 25, 17:41, Paul Kocialkowski wrote:
> > The v3s mixer config definition is a bit messy. Tidy it up.
> > No function change is intended.
>
> This patch didn't make it in the previous cycle.
> Would it be possible to pick it up this time?

I guess this is going to conflict with Jernej's refactoring / cleanup
series.

And, I think v3s is not the only one that has fields in a different order.
Might we clean this up after all the refactoring?


ChenYu
