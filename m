Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFDA90E986
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 13:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6757D10EC55;
	Wed, 19 Jun 2024 11:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar-org.20230601.gappssmtp.com header.i=@fooishbar-org.20230601.gappssmtp.com header.b="uvB2cByh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6610A10EC5A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 11:34:27 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-7955dc86cacso361698785a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1718796866; x=1719401666;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9fholmAL3OeBvxeRVBum3NdobGbdweLBjTLLtkeRi6k=;
 b=uvB2cByhIWILAebDqs+dXeLMyoOsKUZhJWDB4rOV3uZ4ZqDI3AzkV1LKzrvjHYSB6w
 /BJPBi/wvdgPykmRnDWktbviYqO0GsF3yruJ9M5Ba9kSeeVnbm/dC1+bU+6rsX/VLUe5
 vV93VREeQSCcrmIvwtWW5ALnQLIin2Fv5I/xi2DiOaY8+vqPfW76E83lbHTA9mv5VJ87
 UE52FqyfBZaO0KHd0kfX9VsPIT8DL7ISo6KIm59CljVQFYl7VDkVsAOVD7PFJQ8S0Sem
 eJWra8geQ7v5ailHHV4sACALQOgZ95GrZ4yoPcoJQicmF3v656fUgev09D4xPnCj33gx
 GrhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718796866; x=1719401666;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fholmAL3OeBvxeRVBum3NdobGbdweLBjTLLtkeRi6k=;
 b=itvoVpD7qFkJDd5N35Lt8c8jkg6FxnGqgXd0ABggD2wlM1jCCGDl7ee3EXtCc+4CqH
 ugUZfIJZ2dKKh0BmVJgDk7IobU6+jA0JjE10ZAUA7cY2gE88sK8Se4T1SbnnPdZMcOXJ
 nOIewv5D/RZGLKAzL2t6I4pB140Z/ax4eAAlmQU0+Vj+iWaBNdVKk84+g46zxj9iYqBN
 i0FSBj6/1mgvpm2R2NoWfG9b0kLHK70g/3gWgtHTWfRKYYA2KB83OR9CnipVWlhQJ6el
 gHLWCs7qvsYRJhJOG06m4NGFYxzAcMLyNtLse6whRrS9hMESvRzGVMUbt629aUppcrA6
 8ccQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM58LLPjWPWBoQ6CqoLCCgIIeAph9uzdvaluNF/+/928G8I/uqX5YUzVBCdltkvJrPB44atltbOrBcQ0LdEmqpktJJWc95OxJ0V8BANp98
X-Gm-Message-State: AOJu0YzDo9XFJLm/2iaHVc4VtNWNeu3otini1BGuE7rfKGjuttOX7yFq
 19oFvsr4hX5JmiW1jgfBHWL89jBinCbSWHChZzAYshNfG4r9XBYQ5FENtW1bSOPKrFnuWIisBAb
 iCy08+uxOLbU+3zIlkl4/ygvLQLra7O7RcxxSrA==
X-Google-Smtp-Source: AGHT+IEgSFcwPm82u8gf5stfX15WozNE1lQj0lsTnEb7wbQxmPEfHb+S5KLUJcDiDkb9ApM0vVHMOviDtilCg3GKejo=
X-Received: by 2002:a0c:e10c:0:b0:6b0:77fb:8f16 with SMTP id
 6a1803df08f44-6b501e25bf9mr25755236d6.21.1718796866109; Wed, 19 Jun 2024
 04:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240612204712.31404-3-ville.syrjala@linux.intel.com>
 <20240619113144.1616-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20240619113144.1616-1-ville.syrjala@linux.intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 19 Jun 2024 12:34:14 +0100
Message-ID: <CAPj87rPH+Hb49R-ebk=-GavGiRcjef8dkv62-yFy33TXdO5NtA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drm: Export drm_plane_has_format()
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 19 Jun 2024 at 12:31, Ville Syrjala
<ville.syrjala@linux.intel.com> wrote:
> Export drm_plane_has_format() so that drivers can use it.

Acked-by: Daniel Stone <daniels@collabora.com>
