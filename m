Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBF7CD2CC5
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 11:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C646910E20F;
	Sat, 20 Dec 2025 10:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LlFWCAG8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE3010E105
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 10:01:48 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-b801784f406so308803466b.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 02:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766224907; x=1766829707;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
 b=LlFWCAG8llx83AYbiqgbw3sb3twEXpKJHaZrOHgfPqD0FbukGfTPlfvHxWBM10Hs8G
 lxKyPoszc82PMrpdpCKYmydRDfaRXjZA4S6CrHgFNdefOW+57iTVz6xxvTWiJLFcE6wP
 //YEe1UA/WQgcVp5aYjPFWfaM4ifpcdlyBEVneQCHNXaB0hjGwdMs7RwBrzPMgZwyVHi
 6NvMP7HHlNmxDLsF6jCv2Rem7CT+CCNg8tgetNmv0iDSxyK1mSzBEW9rMRqlGtV9Whad
 WTjXipTBKvfOQ32U7C4QKpnykUNf0xVKaq5iXnDQl/Y2hvHnE1ej5Yuq1OKk52jA/CvW
 1law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766224907; x=1766829707;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
 b=jInr8miAVhlSw5ZV+1t84DwJvw8bSiA0u4uqpBUqoiD51tPRy/zMeuDjSGMD5BrODW
 OUxX9OIXKTI8S2orwPwnZU2dFV/uAACML8elUnEkr51abROLB24Y2olwJ3BbZ16vO0gK
 2XKH05xwiqTeV9gRLaw/HTUq8djKgnD1xzgJwB915Gei9dtjIrTt1/OO56AKyHITjyNo
 2+BfpQ7s0HeKoyoqZF9918AYg2MM8foVGrD62n8Lv3KDnx2r0tHJhhpWbVoeAW5vwPcO
 B+dPdKAyEsSwDlQ7xo8A3j335lwclMnCQJmAEJiP/7QlQTcq+n+xnoy7F+uHS4PXC+CN
 vWkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJMhKqg4FuOlX79zIMozPmsm5CyclawJBMZQg1aR5rk54CJjLgeEumwSVKtszv5Y0/Pu7525qFtgU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA0AjNrIRIHSgc5sPfJMPjxSny37ITA2IoZPabCBLLEA3GLdfB
 4PsV2yM9aee5fizdeOr+lszaD1pnODIxcZHzDzd25LL0+ykOWjZ9D0/pnl51wt502nj7UBBdkb7
 n77yUQ95ely0w1KD6SA==
X-Google-Smtp-Source: AGHT+IG5pJx6M7iv4XX9yaURjf8mepTlu7YYJc3wOo7y0QcuEDT1u5dJwGmGqq3CfkKzGEqd1szxRNtAfdZCVwY=
X-Received: from ejdcw8.prod.google.com ([2002:a17:907:1608:b0:b72:41e4:7557])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7e85:b0:b73:4006:1875 with SMTP id
 a640c23a62f3a-b803719ef9amr511534366b.38.1766224907016; 
 Sat, 20 Dec 2025 02:01:47 -0800 (PST)
Date: Sat, 20 Dec 2025 10:01:46 +0000
In-Reply-To: <aUZw4fpWRUWFsb9r@google.com>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com>
Message-ID: <aUZ0CsLrHjP3wMac@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-media@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"
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

On Sat, Dec 20, 2025 at 09:48:17AM +0000, Alice Ryhl wrote:

Test email
