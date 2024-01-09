Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF71828FF9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 23:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F27B10E531;
	Tue,  9 Jan 2024 22:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2927A10E531
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 22:32:31 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-7831806c51bso282155785a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 14:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20230601.gappssmtp.com; s=20230601; t=1704839550; x=1705444350;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ynsR4nnFEaZADpxDZxOiLIugSOI6RO8hBMHt22YNR9I=;
 b=celG7Btyc44T7hplGSCaQyHNuGCtEgipm73fSr5ULBkjVb8tAWFmsrq5uAjZoedcqv
 gFwgmL6Jps1SaZWKM6k2DIRtwuSneaNuTrXlMZGUwQu7SUkGQZ+2pCadLoNOaZhN/Tuj
 4hkjIhHTUWklYGdD6zbtA5+t0Fb3ZyO4LHOtsCXkyIgDZevu9n1+VWEn3ADMGizp5Fsv
 k5xh7/aE3UN2aTSzAbE/B1NCvGVO5IWJQGHIkQsqhR/JD5dnxup+5irGEFqxUKR/bZlJ
 ZZH6D1D3XNOtFvHrkfpsX9Kgrp+xXo8OruO0N/ogS50EK2ZIaQcicMkSQAP3sYalFOU+
 PuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704839550; x=1705444350;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ynsR4nnFEaZADpxDZxOiLIugSOI6RO8hBMHt22YNR9I=;
 b=uD0Rz7Aj6hjiMj4TmyrFRtCIiJFxfNnEnnvGq3eltQKseDYKU3T1qj+5DcRKilzk0L
 YYrtlg+5DIgAWt2xI+2okxjbn7XfBgMiJu9eNHJXgRS+r72jhd9vdO58AOg/B08H5j7M
 zyTIS+WuTWI8tnRAhEz0PeSQQLKbOn/glScXn2xDykkXA7zwaSCfC77G0ISoztX4wlfu
 74aq4bsbk8N2nq/QPUjdi8nW8GKemFcY/hlOBxrooH2+/Pz5eG2li7xnrM8KuQpH+anL
 OpxRF7+qfcrGgG0L+qGpERnlv6UIHGRMLvNu0xJUMsPcTMKy6p668yf4x2IznyRYn7dN
 oh+A==
X-Gm-Message-State: AOJu0YyvPVL6v9/ffpvzIH8sc6E7PGxF2gLCQGnh2QRLJSR4OEkLrlAY
 Zly7yrVqhanrn0K54SdndalHzTHaFKy94Yct9JJZltY1MMq3CA==
X-Google-Smtp-Source: AGHT+IEni1Ntup6ec+s61FZRN+0Cq4rkHJLzEGZRkocUASUKr2AOtWgASwxL8J0ZDkXeq6OC/kMNJ7/4oMga4t3FLWw=
X-Received: by 2002:a05:6214:48f:b0:680:857:1bd9 with SMTP id
 pt15-20020a056214048f00b0068008571bd9mr218069qvb.82.1704839550148; Tue, 09
 Jan 2024 14:32:30 -0800 (PST)
MIME-Version: 1.0
References: <20240109181104.1670304-1-andri@yngvason.is>
 <20240109181104.1670304-3-andri@yngvason.is>
In-Reply-To: <20240109181104.1670304-3-andri@yngvason.is>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 9 Jan 2024 22:32:18 +0000
Message-ID: <CAPj87rNan8B5urDFkmD_Vti4to6p3NmvXYsTFQTNg-Ue2ieDug@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/uAPI: Add "active color format" drm property as
 feedback for userspace
To: Andri Yngvason <andri@yngvason.is>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 9 Jan 2024 at 18:12, Andri Yngvason <andri@yngvason.is> wrote:
> + * active color format:
> + *     This read-only property tells userspace the color format actually used
> + *     by the hardware display engine "on the cable" on a connector. The chosen
> + *     value depends on hardware capabilities, both display engine and
> + *     connected monitor. Drivers shall use
> + *     drm_connector_attach_active_color_format_property() to install this
> + *     property. Possible values are "not applicable", "rgb", "ycbcr444",
> + *     "ycbcr422", and "ycbcr420".

How does userspace determine what's happened without polling? Will it
only change after an `ALLOW_MODESET` commit, and be guaranteed to be
updated after the commit has completed and the event being sent?
Should it send a HOTPLUG event? Other?

Cheers,
Daniel
