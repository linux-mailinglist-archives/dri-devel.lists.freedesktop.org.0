Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86069F956A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 16:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2627D10E4DF;
	Fri, 20 Dec 2024 15:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="PONDcoIO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A968A10EFCB
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 15:27:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so1238228f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 07:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1734708441; x=1735313241; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=VrmPfrn+CP6ykxceeXHPQ4EepMRW1jN9PRe+fre8tZY=;
 b=PONDcoIOAX/TMhxmM/fQSaqGXSxER9MxdVv4PeQpZU765PSENG+Yc7hmygz8CqMq/2
 PNROYnGZcOCHokTrGufGB2IDUBAFnZd/MejDj1au4ZrSfteD7C4NtkEZ7oC1fsIAaRY2
 y4m87Xo0aaxAugWN9+9Dku4ClEQNPoTDiwMBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734708441; x=1735313241;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VrmPfrn+CP6ykxceeXHPQ4EepMRW1jN9PRe+fre8tZY=;
 b=sqoGnR+lrb22Aicgmq2hTGNSOkuQB/gXx3KUTgxfJ58CJE0EDn2N87q44qmLL2K3r7
 KwUUK2puU1Fg14ZgCgiMuEOthJXdvzgCyOKIapdcFEX9zxnuU01Fy1uFz+OmaQ7zlJCO
 iTeE4bOXi3Y3CejORtwSG2W7fNjsUR15sXRua8YsqXyJEk25vguyUnpS397IVM4UWXvI
 hyRtoAPJ5prMrdqA83sFx1OdFz6lL5ZW6JNu/ADsilXQbXwTh8tjxnjVusjAqTbOsZBf
 upXrmE9gWA1Ef0NxolPIj2KwPs64u7czzlLfz8NDtakRGKAbboaWRDIHc2d7A8LVLVwb
 9NMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaLmuQjgfxRzKLjO8hDze31rEvlNqxxR6uONVagnYChrxkSlD3SXg+qtpyNNTq0bYKfSDv/JXJ3To=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyyyrFCeEN/xSa78JxBJfZbGh+0XGu+1ANIvqcwMTKVF1XcR+M/
 x4XIqH5WMW9xIEPJATJuQhLks9b2p09QzBEHeVq2kOWUv4k/pF0y+FsgsB2brDg=
X-Gm-Gg: ASbGncuHSTk8107hThBcER19DNngLPdePFE7Cz4Iqex9CmPRE0gvAsnkUZS27ZPH8eV
 iQWp+Ay6dRdcYPpp7mFlH0FJcC/5gpuTBHkaJj3UYpFLW8GKVQujUvdRc0yidLdzoRD93RNvY9F
 UZ2qXVmfjneiLZh+2fKEyKdnrjQ9+W6YR5HbQhHXE8wdBLxbLYNkpSHEkoPp57R20GGiqMC5NF9
 J7H0ufndeLvVj+KMv6Vgb2da53O2r2xW6PTy7X5sD0I6rrPaxFE0//vJaO6i2TqEmTE
X-Google-Smtp-Source: AGHT+IGtSd1+FezdTCe7KFiVWfPJ6L2nAIbZNu/ORFwIpgX2VS4SwSKcDTq/ynjV3mWRNC77rNWnfg==
X-Received: by 2002:a05:6000:4914:b0:386:3db6:2775 with SMTP id
 ffacd0b85a97d-38a221f76ebmr3428870f8f.25.1734708441074; 
 Fri, 20 Dec 2024 07:27:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1fa2bdfbsm3407413f8f.102.2024.12.20.07.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 07:27:20 -0800 (PST)
Date: Fri, 20 Dec 2024 16:27:18 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Cc: Brian Starkey <brian.starkey@arm.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <Z2WM1pbVvNKdj6QJ@phenom.ffwll.local>
References: <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAAxE2A5+=QVAFXXCbe3qEgY-Mzb-5XW73CYdANEO+N_xA+ivaw@mail.gmail.com>
 <zfjnuz2pfg7j2g2zrbt5ryde223plzr4rdyk4f4ans5znicw3l@kbebotesmobf>
 <CAAxE2A6u4Ee=yBJHo9uKr0Be8Ta3MwSxvt79GcbF8D0R952_FQ@mail.gmail.com>
 <nlcq3xjef3mapwumuelnspinmgucersb5gazk2p7yxqv5aops7@t3p2e4sze75b>
 <CAAxE2A77DVSWM0vOZcBSmM+1sbt2kOdCC7SRDMRpeBPsW_J2Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A77DVSWM0vOZcBSmM+1sbt2kOdCC7SRDMRpeBPsW_J2Vg@mail.gmail.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Dec 20, 2024 at 09:24:59AM -0500, Marek Olšák wrote:
> >
> >  * Modifiers must uniquely encode buffer layout. In other words, a buffer
> > must
> >  * match only a single modifier.
> >
> 
> That sentence is misleading and impossible to meet. Specifications are
> sometimes changed to reflect the overwhelming reality. Multiple modifiers
> can represent identical layouts - they already do between vendors, between
> generations of the same vendor, and accidentally even between chips of the
> same generation. Modifiers have already become 64-bit structures of
> bitfields with currently 2^16 possible modifiers for some vendors, and
> possibly exceeding 100k for all vendors combined. Encoding all linear
> constraints into the 64 bits is one option. It needs more thought, but
> encoding at least some constraints in the modifier is not totally off the
> table.

Yeah uniqueness is not required, we just try to avoid it since it causes
some pain. Worst case all drivers that care about working sharing just
need to make sure they advertise all overlapping variants they support.

> The semi-functional LINEAR modifier needs to go. The idea of modifiers is
> that nobody should have to expose one that is unsupported to keep things
> working for a subset of apps. If the LINEAR modifier is a requirement
> everywhere because of apps, and even drivers that can't support it must
> expose it, that's a problem. It causes GBM/EGL to fail to import a DMABUF
> for a random reason and it can't be prevented without, say, looking at PCI
> IDs. If that happened for any other API, it would be considered unusable.
> We can either fix it (by replacing/deprecating/removing LINEAR) or abandon
> modifiers and replace them with something that works.

I think Daniel's forward compatibility plan is more solid than trying to
deprecate LINEAR itself, that seems like too much an uphill battle to me.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
