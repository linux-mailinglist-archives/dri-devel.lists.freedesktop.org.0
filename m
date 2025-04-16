Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FD7A8B4FC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 11:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E29510E24E;
	Wed, 16 Apr 2025 09:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XdX2e+gs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0E210E24E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 09:15:59 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaecf50578eso1123307966b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Apr 2025 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1744794955; x=1745399755; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IzhnoFqnW97ZWcB8cV008PI+qdwCPI2w8UehlUonwcU=;
 b=XdX2e+gsOI34K3nQmKdJI8PF3BMhCcjGD8Tbc/LU5HqBMHyfEFhTrlxmZIOkNf/TnF
 83PFXVS4OT8UmVTLEMRzH2/dwHrzE70+NDafx2ulyk/ZXy9fS3HFJzL1u27pwAa5GEFZ
 N+2677gChtY46tnJ4JAm05lHxLYhHbai8ENqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744794955; x=1745399755;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IzhnoFqnW97ZWcB8cV008PI+qdwCPI2w8UehlUonwcU=;
 b=cqZq5pZLanxw0nriq+4NhHEQprOLIOXV9V7aJBl8ZjeBHATsx2aQ2KN0aAgxetmRk7
 S3e78B6C4ko8zDBbdx3u2XNmCtMzdFx1Rd8rinqzSllbni79bW9LU2bL63JeZ9+lbmQe
 s8SfsWG8vW5XL+HfsEsIdGSrP9BHMVNNzvvSN7izrQdEHi/YDvDoCuVKwCieQRYSohpN
 jKv7ieNu27ryF3wlRzkuVY+yyeZJDPHuQYdqG60nYUaZXMespvrV+r8UbAdiOVD819h+
 gzzcYO0oPbLGf2bxRwr1z6LOTx09a+xNJMUZbjtYswRfY2WAPK9V4B4FOPFqwYTU7H/S
 Jy7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHH5v+W7Wm9Ub4PcVpqPuE0bVf4OiUU2QMVeUZUcXPm7c8TdUoj4+2xBYJLKmuu5dEMIc/8fXzf1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnFODwZwuR+QIpPamIyrVze9GgfN05eWwv70ZX6u2AQhCqoNyR
 RvUN93Au62k+vwDy+vO/clY33mtFvcKoyOpzSm2+4jea58DPYfHzGseQsKCM3pM=
X-Gm-Gg: ASbGncu+eGvefr/Y2M2broMG58vcXu1MaYUciTyYk/EZtJ7HNM4evi21SOjydiTmREl
 U5U+XgWVvdRMgE9RBuke8FrdcQY7JZ0CAogohcqQr/RYaKzhZHtVjSUbQzzUvX2jAi1GmE67Nl/
 msGJlkgKhfiSkZXNDSPzWNZph8BHpI2NB7K1Voq1nZtJ9RrNBl3U9BZ/3spUqxyB93KK4lnxfxw
 lXbp4E1ve5w9lFLYVgAnYjkqvYLKzT3yspZNshvIoJfahFqbvntfPi4iCz7QVKNFjryBkuXcfVw
 owP6etD6jLNSDHhFpFr/bhl+/1jsAWCVYpyorPKcVjO+4yRwiSxe
X-Google-Smtp-Source: AGHT+IE2LhmPOEWL2QBw0Z5wzYlEqe3D92PMKPrwDxClILzG2RD6atPvXiMciXmIdgmf/8PElhtnPw==
X-Received: by 2002:a17:907:7203:b0:ac3:413b:69c7 with SMTP id
 a640c23a62f3a-acb42b738b3mr82289066b.39.1744794954916; 
 Wed, 16 Apr 2025 02:15:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acb3cdda638sm92484666b.66.2025.04.16.02.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 02:15:54 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:15:52 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, asrivats@redhat.com, andyshrk@163.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] drm/gem: Internally test import_attach for imported
 objects
Message-ID: <Z_91SGKoCbkC1k9R@phenom.ffwll.local>
References: <20250415092057.63172-1-tzimmermann@suse.de>
 <e2e82102-eb9f-4eb6-8ac3-6122ed7fcf28@amd.com>
 <48ab9b82-0d26-4d7c-88b0-feab9762b128@suse.de>
 <b924ffa7-99c0-42f1-9170-069e92299021@amd.com>
 <ddb93e8d-7716-47b3-b06c-0bf862d9c32b@suse.de>
 <ac0aba3d-ec77-4f6b-9ac1-f6077519f30d@amd.com>
 <Z_5a3ckZiY-fINNW@phenom.ffwll.local>
 <5a1b160f-0ea4-4c31-b777-b8ab81b6c394@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a1b160f-0ea4-4c31-b777-b8ab81b6c394@amd.com>
X-Operating-System: Linux phenom 6.12.17-amd64 
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

On Tue, Apr 15, 2025 at 03:57:11PM +0200, Christian König wrote:
> Am 15.04.25 um 15:10 schrieb Simona Vetter:
> >> This is for devices who only want to do a vmap of the buffer, isn't it?
> > ... it's for the vmap only case, where you might not even have a struct
> > device. Or definitely not a reasonable one, like maybe a faux_bus device
> > or some device on a bus that really doesn't do dma (e.g. spi or i2c), and
> > where hence dma_buf_map_attachment is just something you never ever want
> > to do.
> 
> Even in that case I would still suggest to at least create an attachment to let the exporter know that somebody is doing something with it's buffer.
> 
> That is also important for move notification since you can't do those without an attachment.
> 
> BTW: What is keeping a vmap alive after dropping the reservation lock? There is no pinning whatsoever as far as I can see.

dma_buf_vmap should also pin, or something will go wrong very badly. And
that also can tell the exporter what exactly the buffer is used for
(kernel cpu access). I really don't think we should mix that up with
device access as a dma_buf_attachment.
-Sima

> 
> > I think we might want to transform obj->import_attach into a union or
> > tagged pointer or something like that, which can cover both cases. And
> > maybe a drm_gem_bo_imported_dma_buf() helper that gives you the dma_buf no
> > matter what if it's imported, or NULL if it's allocated on that
> > drm_device?
> 
> Yeah, I had the same idea before as well. Just didn't know if that was something worth looking into.
> 
> Regards,
> Christian.
> 
> >
> > Cheers, Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
