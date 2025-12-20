Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72594CD2D45
	for <lists+dri-devel@lfdr.de>; Sat, 20 Dec 2025 11:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C767910E2C6;
	Sat, 20 Dec 2025 10:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="U7KRWRoK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 085C310E27F
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 10:18:37 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477cf25ceccso25866465e9.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 02:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766225915; x=1766830715;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+oURe4aXMdk0LjKAZ44d1/hPSLfZHh6FrPzIxlIWzd8=;
 b=U7KRWRoKEX8G1249GJssoQfEj86+AwYy34keNYoi18HPm/kArEqd0CRLZ300+pSzid
 at+y7kXsm494dEaNwxOEXEqhmWW+J9rkj0ltkHZM8sDXKEEjazn38eTVhrskBS2wL6EY
 X1D7xGbuhNUAR2dRQOvl7bSeXN9dxCj2eLy47AS1fd7XJ6NCawiTjVWUy7mqn7dK87O5
 0Xz6wUnz26vVj8EDvVYk6De45n/QVdJSFKs2LepD/Z1Kod5iCPDby37bbyBQnz5o1Wmp
 YB65Bcw/L7MqC610K7Ncf05tilfycGutkqC6lUL2i9UPJXBAgIWjnUpV6PniFeznE/H/
 86rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766225915; x=1766830715;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+oURe4aXMdk0LjKAZ44d1/hPSLfZHh6FrPzIxlIWzd8=;
 b=NdUIdq2O4l+MrMS5N102j72bEP0F5Da90vn6BHF4+EekxRuxSal+iK4XEHmddOaWYI
 wRF6dV36lUuGDMKLNUyBNwMfiYyn5jj6cBQfiUNzarKdQDerVaYC6zOiEVjVdy15u4AM
 5jxf6P4Xhipix9Q3+PGncHnMSoFTz1ZGi3HB563X8fTFRrHMJoT7Nd7nRIfnx61CbFcr
 Weh+nETuHohfiLnmc31pvVpw1InLCDyXdzt3VCNWNpcclQkYxZVL7gs4t3qZrXDHU4Sj
 GZarxhG3sQWVjYodH6I2WdAKMCkHf3Vntk7In6S0J4G14DJGDFQPsczbJRxEXi4b7cX6
 qmyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYVZZ0dtd91tQqcjEcsFaojqYOMImQejpMqA/LTTOurnFU0FI/z4Sa7pnyqcAjC9y3UulyfwF1uBQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoifWFwcUAO1rmIHhmMYgNXYTWU7yuyPs1PGgznqhe/jjfpzcb
 NapHoswfmgVg5jlsE/kNxTMRqrr5601VYSov+Srdzt8vIOrKSCSH5Hn25MNG/+Z3G1PdZ50EPUu
 Pfq5FEaw93nJgg4ajpQ==
X-Google-Smtp-Source: AGHT+IHezTbdkQabpgPR3pVcmu1YjPdSolIwP7RQSXNt0PalcelZIDHJL+QGmDx/ShI8sV3gW2XIBlw4p3buplU=
X-Received: from wmxa7-n1.prod.google.com
 ([2002:a05:600d:6447:10b0:477:5a0f:1860])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b8b:b0:46e:6d5f:f68 with SMTP id
 5b1f17b1804b1-47d19566aa8mr51108125e9.12.1766225915629; 
 Sat, 20 Dec 2025 02:18:35 -0800 (PST)
Date: Sat, 20 Dec 2025 10:18:34 +0000
In-Reply-To: <aUZ07zYew7Mfwc_C@google.com>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com>
 <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com> <aUZ07zYew7Mfwc_C@google.com>
Message-ID: <aUZ3-iStCAWShvt8@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>
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

On Sat, Dec 20, 2025 at 10:05:35AM +0000, Alice Ryhl wrote:

Aha! This one didn't get duplicated on lore. It's the nouveau list that
is broken.

Alice
