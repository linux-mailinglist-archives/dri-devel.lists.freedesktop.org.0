Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 078DD8893A2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 08:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A308F10E311;
	Mon, 25 Mar 2024 07:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vrex5BNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3845810E311
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 07:33:16 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e7425a6714so2476028b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711351995; x=1711956795; darn=lists.freedesktop.org;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ekb1jmr1yhblLbCaXw9kmFVcNG95LhtHD4bhX7cojA8=;
 b=Vrex5BNkh6oDFHtzDcZtdltT50GONpRM72Tnhs5ZPQs5C538YSvQpHzslaX8DgC1vn
 0zmwDSSx78oAfQbpQ8RN/mjMc2ZsR6RHEyTBBnq651/L76h6HTSU1qxt9AQkJNjv7+9Q
 TmspVUqgEpvTWmkMfmibYYVEiz9QOlXP7LflxyIJDvaHTecZsBXM7Jq0+kTZ12FvCjby
 ZyXr1miCU+WBVgbyAx52XN2OizfRaLVRHgS7zvSRFsoQAEHTZkWG6hmrNcXdQ2nqSsoJ
 tVMNVYsJEcakKGjEjvHk4mOu1gIwKSjuAVinXzkZ3NvhdkcFTX1jm3BMoHdyzMX30L8G
 CF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711351995; x=1711956795;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ekb1jmr1yhblLbCaXw9kmFVcNG95LhtHD4bhX7cojA8=;
 b=QWyDTLaZKlOKBnD209cPBuYjcyIt5eBzPApts9LQ9HQszJynN0zgcedVFU5vkugv4K
 4e6hgBgqzrY9S/h28mZRkewe/Grpzi5gjri/mdxnCjBppa9YWpQy5OgdKlsK/mXbFl7w
 RZT85CvUg4PGUYGvlrj4PCR/xbxMeuvZjZuHEi4kNbIjqatiNQ1IQ5MCMhrW4JLMEYHG
 GNdpcRjvUH71Pr+MFeYgfAYbfRPVGUqyWL0fRNT92RNo4xdwLLnvp8BoHcq5JvmZHKJi
 KDFGu8jvkHm6i1ToKwu9nTVTv4/4JDq0za3TJ6ws37NfDiZ9p+VBA6nXFJK6zqpVXI4q
 zhkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNuIAHZByQk6ir8kw/FcR1uB40rU0TfDom+cpVATI1ezb7ptliLcRyNTFwfgSYRG4QS96CjuTiC4gSxlOpIjl1o+OC9hFrTFSNsHsxYs9P
X-Gm-Message-State: AOJu0YyN2xpFqkqF1V+hyPKCA4smDaTl+ao2Hhvax1X05M5qe97aOp0q
 MeE0gj8wbUXXbBu4KsezWAiSfmU6Z6Mbyg84154iPKZ8kqpRSDdA
X-Google-Smtp-Source: AGHT+IEzrVS22yW1RU7QOUnKEblxz1JzEyWdpvtohcd1nmbvvbyisaXhYPbg8tqys272nz+V2M+eXA==
X-Received: by 2002:a05:6a20:bb22:b0:1a3:701c:cca9 with SMTP id
 fc34-20020a056a20bb2200b001a3701ccca9mr4419642pzb.27.1711351995432; 
 Mon, 25 Mar 2024 00:33:15 -0700 (PDT)
Received: from [192.168.0.21] ([119.82.122.244])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a170903230300b001e0b3a87dbbsm2337472plh.177.2024.03.25.00.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 00:33:15 -0700 (PDT)
Message-ID: <287eb3f74e4c31adb065668ff49c8e1577388227.camel@gmail.com>
Subject: Re: [PATCH v2] Fix duplicate C declaration warnings
From: Amogh <amogh.linux.kernel.dev@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, 
 javier.carrasco.cruz@gmail.com, skhan@linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 25 Mar 2024 13:03:10 +0530
In-Reply-To: <Zf8--QSkEMDe9zyp@casper.infradead.org>
References: <20240323163148.23497-1-amogh.linux.kernel.dev@gmail.com>
 <Zf8--QSkEMDe9zyp@casper.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (by Flathub.org) 
MIME-Version: 1.0
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

On Sat, 2024-03-23 at 20:43 +0000, Matthew Wilcox wrote:
> On Sat, Mar 23, 2024 at 10:01:47PM +0530, Amogh Cheluvaraj wrote:
> > Fix duplicate C declaration warnings at
> > Documentation/gpu/drm-kms.rst that was found by
> > compiling htmldocs
>=20
> I'm sure this removes the warning, but it removes all kernel-doc
> which exists in drivers/gpu/drm/drm_fourcc.c.=C2=A0 Isn't there a more
> granular fix than this?
>=20

After further introspection of the file drivers/gpu/drm/drm_fourcc.c, I
found that the warning is caused by having the same name for both the
struct and the function as in "const struct drm_format_info
*drm_format_info(u32 format)". This is an issue found using the latest
version of Sphinx as reported by Akira Yokosawa in message id
564cbd05-8788-9223-1ecc-59e7fc41b46a@gmail.com. So by changing the
function name to something like "query_drm_format_info(u32 format)" is
a possible fix. Question is what should I rename this function to, that
aligns with the coding standards? Also suggest a new function name for
"drm_modeset_lock" that causes the second warning.
