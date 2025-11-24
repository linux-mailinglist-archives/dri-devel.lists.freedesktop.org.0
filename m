Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21AC83DE4
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08F7710E36F;
	Tue, 25 Nov 2025 08:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VOH+SwpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBC810E2D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 13:36:34 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-6431b0a1948so7007204a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 05:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763991393; x=1764596193; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E4Kvahk4sfkEzDMtaEQ+7t96X+5OMROz94rsckBU8Tk=;
 b=VOH+SwpUn/rqeJu4Z8gLXuP2/EL+8tSKqjCh/32JcEZlgH7sEDssJp99nP0yKXVs50
 HJmUf0vqCvJlgGFM3MDgUUMll6ADn54a1zE7aVvpvlN/CEVX9AcY0jqjcKNmkIcamY72
 lPA4Otlh7T+hNP4OWhkPrkr4obY2YVkVl2va/Ji7X9Vvu7SbOSjdxuNOWICnliwEmNLd
 /Em6ryxkgEIUlhaTufF/3hqWnj1AH1Qlf8l6F8w8OzRG74oXX3/wzrWM/P7BycPzU6r+
 IsFt90/4wKd52mA+E3ahWVmeVzp4RgSeiX5izPhbJKcQs/FxRRR0AkfYO56O0nL9Hz0l
 YEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763991393; x=1764596193;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4Kvahk4sfkEzDMtaEQ+7t96X+5OMROz94rsckBU8Tk=;
 b=aa3Y+3uPadkdK47+LQvsjzo4oJz5iKECxGGUFtApDJ3Ivd7PElKwXmLhH6A/5SgU8X
 /Li6z0AideEdNX5aERoifZ4h7BJHn5NyXe6dmRFJSJqbo650S7QhTmez7xF/HgVgR9n2
 bA+SGuSgOy0B3wrbi+7rz9jhFS3u506j+yR9b7A8P5FaN2zV24J80ZRnNUEUbxnytTMs
 f1sxu9L+P9awrW1n01Gvh1X8MhP8Q/K983mpwkDEFdcuRrP7avaoh64cf8b/Hqb+4W+8
 3ONuPP8i/zbD6TApQu6JvmOtjjju9kxvECGH1RONZcsjE5yWYkNovcbndHwvPi0XEIJs
 CfWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7FG5aqh3fDCtSV6TlaZJVXbmO9zL67aYMHmBAzd5DubeootwKC7LDAOenfMNdAHIboYQmTm3+Yw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq72AlIDil4p5r+z2hcJ4pbmOfHKAXZrqIxX4UUDIefjNgzxwG
 IB5wN0r0454imteai98vlzVRz1T0EvkpfMU4Tgzo6aeUa/AWu/CDy6X+y3Pw0ZUi/wIeBG8+KTz
 sGBddMb7+fN4wA1LBKulLaWRSfGO81A==
X-Gm-Gg: ASbGncvF7VL7EXONLyBBCwBGr3uTKvD+AAWZKkcDEMNoe/hkqLAs4Hd8mBno42pw9li
 zUV/0W1glc9W8YcEsWtUeDpPmCLT+VM694ImdZOW1X3kC2kVPr6Of9iFb80JFAMyCHvrTzea3rm
 13ukRvYaB+gfBTQ/E9XGfiJU2kNay2LZgtdFoZIGgOr+86EKIfrZGQDlQryMiffFVknge6LZthk
 86v4u4qgymydVjoOL1O8/2r1gTDhhxi1pMUZVyw1zoYtq3HIqZXwjs1N3VBZhanAu9P9hNx9tPx
 W3uFGuQwTr4LReynget+sjs9ByRSCPpKCPZ9zVvzfE/OJoxw4mTbZQ71otbcK9zQOWk=
X-Google-Smtp-Source: AGHT+IEnG4Z6JyAnZPsc9zRPIurpTL3mzwNg7U8txyPxgdZYEAlachoenhHzENGex2kidp1+A4wUbZCJxBRlVZeptSQ=
X-Received: by 2002:a05:6402:34c7:b0:640:edb3:90b5 with SMTP id
 4fb4d7f45d1cf-645543493b7mr10042269a12.7.1763991392543; Mon, 24 Nov 2025
 05:36:32 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763725387.git.asml.silence@gmail.com>
In-Reply-To: <cover.1763725387.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Mon, 24 Nov 2025 19:05:54 +0530
X-Gm-Features: AWmQ_bkynwx2lMdwns4GsIfVtYmI6CqY40r8-Afst6-_o29b3r6t6sfqC-dnOGU
Message-ID: <CACzX3Au7PW2zFFLmtNgW10wq+Kp-bp66GXUVCUCfS4VvK3tDYw@mail.gmail.com>
Subject: Re: [RFC v2 00/11] Add dmabuf read/write via io_uring
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org, 
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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

This series significantly reduces the IOMMU/DMA overhead for I/O,
particularly when the IOMMU is configured in STRICT or LAZY mode. I
modified t/io_uring in fio to exercise this path and tested with an
Intel Optane device. On my setup, I see the following improvement:

- STRICT: before = 570 KIOPS, after = 5.01 MIOPS
- LAZY: before = 1.93 MIOPS, after = 5.01 MIOPS
- PASSTHROUGH: before = 5.01 MIOPS, after = 5.01 MIOPS

The STRICT/LAZY numbers clearly show the benefit of avoiding per-I/O
dma_map/dma_unmap and reusing the pre-mapped DMA addresses.
--
Anuj Gupta
