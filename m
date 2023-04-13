Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5116E09C3
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A8610EA93;
	Thu, 13 Apr 2023 09:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3458B10EA93
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:08:41 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-94cd6f4da9eso43545266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 02:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681376919; x=1683968919;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nkjgOgQaTYoZ/lKd7dVARVfqkaE07lmb/0LHBLtokwI=;
 b=DmoWt1n1Ndk0BWG21tCK1h/xsJJlunkF2WpVs99xIvEXKpe5ltyfLYqxTAZlILPjQu
 J0BoRNDUS/3gofHiPN6VKDvi7fPzRUp20lR7YhZ54S7YPNwy5es5XSUW0DhfS/PVXHiR
 wBx5l34LCS4yi/71c8fHfgOz/fXZ50VIqOtO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681376919; x=1683968919;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nkjgOgQaTYoZ/lKd7dVARVfqkaE07lmb/0LHBLtokwI=;
 b=RQKLglZDxcHqQiwgTCeka2oblUacZCYcOMUqeKyOn/dudv4/2cNruDTQECkUXiYfpq
 Id9xtaXrJ9szWsuzkIUQyU0XdhqhKV8KteMSHtLfgf9fShFrWtbHIFLPj1LDKbXLVurS
 SS6CxqleMPBb2b6YC4RbuRcjQGSFaLhyTPi69kdMtI1FUzFmYMPrCxMEXifdwDUAQztf
 IjN+1gaiX0anf9ZFWgBP5ThLwJryTJt01Xxn03B0otFbnc+dY5lBUFhoKWIcJSD3Eg7R
 uNvdUjLns9wV6uvEJPZpiqLg7HTifciOkmESF8kUr55Wv9fquCroOdPg8VxiQICOtVkN
 Gplw==
X-Gm-Message-State: AAQBX9dzWBE5HzHcK2lzblWndixX4g0VJHINgLBgW8++oMeknugyw3ar
 vvUwhE1hFlufcfUlOzP141px9Q==
X-Google-Smtp-Source: AKy350b6vu931p6e6pBjGO1MNjEijdRssMKrtNHNhyq7g+jatjk4ndtAxi122ESnhSE2KG/hTsQLTg==
X-Received: by 2002:a17:906:19c:b0:94a:80f2:d210 with SMTP id
 28-20020a170906019c00b0094a80f2d210mr1722697ejb.4.1681376918955; 
 Thu, 13 Apr 2023 02:08:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 fy1-20020a170906b7c100b0094e4b8816e0sm650537ejb.217.2023.04.13.02.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 02:08:38 -0700 (PDT)
Date: Thu, 13 Apr 2023 11:08:36 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [RFC PATCH 9/9] drm/rustgem: create dummy IOCTL with number 0x00
Message-ID: <ZDfGlHgzwF3UfvrX@phenom.ffwll.local>
References: <20230317121213.93991-1-mcanal@igalia.com>
 <20230317121213.93991-10-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230317121213.93991-10-mcanal@igalia.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Wedson Almeida Filho <wedsonaf@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Gary Guo <gary@garyguo.net>,
 Alex Gaynor <alex.gaynor@gmail.com>, Asahi Lina <lina@asahilina.net>,
 Boqun Feng <boqun.feng@gmail.com>, Melissa Wen <mwen@igalia.com>,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Miguel Ojeda <ojeda@kernel.org>, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 09:12:13AM -0300, Maíra Canal wrote:
> In order to declare IOCTLs with the current Rust abstractions, we use
> the kernel::declare_drm_ioctls! macro. This macro considers that the
> IOCTLs are in the right order and there are no gaps. This isn't the case
> for vgem, which start the IOCTLs with 0x01, instead of 0x00.
> 
> With the intention to use the kernel::declare_drm_ioctls! macro, create
> a dummy IOCTL with number 0x00, that returns EINVAL.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Random idea, but we might want to push a dummy nop and einval ioctl to the
gem rust stuff, that's generally handy. We have it on the C side too :-)
-Daniel

> ---
>  drivers/gpu/drm/rustgem/file.rs | 8 ++++++++
>  drivers/gpu/drm/rustgem/vgem.rs | 1 +
>  include/uapi/drm/vgem_drm.h     | 4 ++++
>  3 files changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rustgem/file.rs b/drivers/gpu/drm/rustgem/file.rs
> index a3714e8ca206..f26b74204361 100644
> --- a/drivers/gpu/drm/rustgem/file.rs
> +++ b/drivers/gpu/drm/rustgem/file.rs
> @@ -27,6 +27,14 @@ impl drm::file::DriverFile for File {
>  }
>  
>  impl File {
> +    pub(crate) fn dummy(
> +        _device: &VgemDevice,
> +        _data: &mut bindings::drm_vgem_dummy,
> +        _file: &DrmFile,
> +    ) -> Result<u32> {
> +        Err(EINVAL)
> +    }
> +
>      /// vgem_fence_attach_ioctl (DRM_IOCTL_VGEM_FENCE_ATTACH):
>      ///
>      /// Create and attach a fence to the vGEM handle. This fence is then exposed
> diff --git a/drivers/gpu/drm/rustgem/vgem.rs b/drivers/gpu/drm/rustgem/vgem.rs
> index c2fc55bb39bd..64e8f1c2cbca 100644
> --- a/drivers/gpu/drm/rustgem/vgem.rs
> +++ b/drivers/gpu/drm/rustgem/vgem.rs
> @@ -55,6 +55,7 @@ impl drv::Driver for VgemDriver {
>      const FEATURES: u32 = drv::FEAT_GEM | drv::FEAT_RENDER;
>  
>      kernel::declare_drm_ioctls! {
> +        (VGEM_DUMMY, drm_vgem_dummy, ioctl::RENDER_ALLOW, file::File::dummy),
>          (VGEM_FENCE_ATTACH, drm_vgem_fence_attach, ioctl::RENDER_ALLOW, file::File::attach),
>          (VGEM_FENCE_SIGNAL, drm_vgem_fence_signal, ioctl::RENDER_ALLOW, file::File::signal),
>      }
> diff --git a/include/uapi/drm/vgem_drm.h b/include/uapi/drm/vgem_drm.h
> index 53ee3af0b25a..1348f8e819ed 100644
> --- a/include/uapi/drm/vgem_drm.h
> +++ b/include/uapi/drm/vgem_drm.h
> @@ -36,9 +36,12 @@ extern "C" {
>  /* Please note that modifications to all structs defined here are
>   * subject to backwards-compatibility constraints.
>   */
> +#define DRM_VGEM_DUMMY		0x0
>  #define DRM_VGEM_FENCE_ATTACH	0x1
>  #define DRM_VGEM_FENCE_SIGNAL	0x2
>  
> +struct drm_vgem_dummy { };
> +
>  struct drm_vgem_fence_attach {
>  	__u32 handle;
>  	__u32 flags;
> @@ -54,6 +57,7 @@ struct drm_vgem_fence_signal {
>  
>  /* Note: this is an enum so that it can be resolved by Rust bindgen. */
>  enum {
> +	DRM_IOCTL_VGEM_DUMMY		= DRM_IOW(DRM_COMMAND_BASE + DRM_VGEM_DUMMY, struct drm_vgem_dummy),
>  	DRM_IOCTL_VGEM_FENCE_ATTACH	= DRM_IOWR(DRM_COMMAND_BASE + DRM_VGEM_FENCE_ATTACH, struct drm_vgem_fence_attach),
>  	DRM_IOCTL_VGEM_FENCE_SIGNAL	= DRM_IOW(DRM_COMMAND_BASE + DRM_VGEM_FENCE_SIGNAL, struct drm_vgem_fence_signal),
>  };
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
