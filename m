Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CA63C3FAB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 00:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C9D89AE6;
	Sun, 11 Jul 2021 22:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0C989A62
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 22:30:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id l6so1773100wmq.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jul 2021 15:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kJGdAsVw4ebFUHA+vyVHxlDG16FQjlll2lFr/efuLTY=;
 b=j4q8i52hEXdsGIpbDDjjUD0fEDn/RuAfu+kgg07hI/gH5I+0f5N0nsQIk9j1Pnz4zn
 qgw2NSFllkVSEqYNnOR/dTXX0uLJB4rMqSo7/7C3bBYk8AOcJn9hYjl+N7W1BqI06q0S
 UwTaSVOEQtAyUk1VTTLqSiTv1gVBO6EH/TF0Yt7e2X7gB8n06FFjvtW2M16E6Md+9lkW
 9Dqg4nlhjfgUTDbhYo4lOQmDq8A6fytwydjw86bkYcNr132X2CQveKgxqOVr70j69VvX
 ofTBYMwh/mcUVg4YQeD/3FhaYmhfFBQTEGQnXSYRKKp77aFekR+dPqfZ39g697XgNsOd
 DJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kJGdAsVw4ebFUHA+vyVHxlDG16FQjlll2lFr/efuLTY=;
 b=VoXBS1MNq9q9PS3Dvn1iRFAF8Xg7KqfZufqbUSUby8fnQWqGSXYJvbvVZayD9AHRw6
 gW/YRLeMzW5KUXlZW8UrCs8tTfVxqEpbiTKiGZI2SfglZZPajbhe9Z6b4fPGb+uJo205
 WaZqmjiiM5QeBFr7TcB2ubsMIwMmUKD2pHROZUIaYcS9RqgXx0TkTu76lXGe6GEpKXt+
 rd4slx09w89UQgkYefJcPxz/LAJYqz3qiNxB3ubwlqh4/eJkA5arE5VImeBjF6kWMjqG
 C8j1vzk8k+NG01BM1tvckeOSqpjfBBRhpegIx7cJI57ywHdXV3C0FDOa9Bt7iZrQAY49
 jWMA==
X-Gm-Message-State: AOAM531MLPWltsAnNLdq0nBXUeFr1+f8cr1yjm8esfMrMJGyv9dx3yW+
 PZVcZy0Ya4a1CUMHJpIbqgU=
X-Google-Smtp-Source: ABdhPJxVUTIIlDh0d+rTKQ+E4Dq+r6/1xNcUjw/0qNpS0V3b+Uc/tt+EyRXwKH0luVww4nOj2mMuyQ==
X-Received: by 2002:a05:600c:4f54:: with SMTP id
 m20mr896740wmq.52.1626042615130; 
 Sun, 11 Jul 2021 15:30:15 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id 19sm913916wmu.17.2021.07.11.15.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 15:30:14 -0700 (PDT)
Date: Sun, 11 Jul 2021 23:30:09 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
Message-ID: <20210711223009.777zvh7m5ihpb3ny@smtp.gmail.com>
References: <20210705074633.9425-1-tzimmermann@suse.de>
 <YOLQbp7m7ggecg05@phenom.ffwll.local>
 <246a3772-b632-c7c1-c1ec-5ac1277f7525@suse.de>
 <YOMVFi3q/JSoZ+p9@phenom.ffwll.local>
 <20210705212945.qwwrrbxe5ygotycf@smtp.gmail.com>
 <4c2dac42-672d-bbf2-32bc-592799be0963@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c2dac42-672d-bbf2-32bc-592799be0963@suse.de>
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
Cc: airlied@linux.ie, hamohammed.sa@gmail.com, dri-devel@lists.freedesktop.org,
 rodrigosiqueiramelo@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.07.21 um 23:29 schrieb Melissa Wen:
> > On 07/05, Daniel Vetter wrote:
> > > On Mon, Jul 05, 2021 at 12:05:28PM +0200, Thomas Zimmermann wrote:
> > > > Hi
> > > > 
> > > > Am 05.07.21 um 11:27 schrieb Daniel Vetter:
> > > > > On Mon, Jul 05, 2021 at 09:46:29AM +0200, Thomas Zimmermann wrote:
> > > > > > Vkms copies each plane's framebuffer into the output buffer; essentially
> > > > > > using a shadow buffer. DRM provides struct drm_shadow_plane_state, which
> > > > > > handles the details of mapping/unmapping shadow buffers into memory for
> > > > > > active planes.
> > > > > > 
> > > > > > Convert vkms to the helpers. Makes vkms use shared code and gives more
> > > > > > test exposure to shadow-plane helpers.
> > > > > > 
> > > > > > Thomas Zimmermann (4):
> > > > > >     drm/gem: Export implementation of shadow-plane helpers
> > > > > >     drm/vkms: Inherit plane state from struct drm_shadow_plane_state
> > > > > >     drm/vkms: Let shadow-plane helpers prepare the plane's FB
> > > > > >     drm/vkms: Use dma-buf mapping from shadow-plane state for composing
> > > > > 
> > > > > So I think right now this fits, but I think it'll mismit going forward: We
> > > > > don't really have a shadow-plane that we then toss to the hw, it's a
> > > > > shadow-crtc-area. Right now there's no difference, because we don't
> > > > > support positioning/scaling the primary plane. But that's all kinda stuff
> > > > > that's on the table.
> > > > > 
> > > > > But conceptually at least the compositioning buffer should bet part of the
> > > > > crtc, not of the primary plane.
> > > > > 
> > > > > So not sure what to do, but also coffee hasn't kicked in yet, so maybe I'm
> > > > > just confused.
> > > > 
> > > > I'm not sure if I understand your concern. Can you elaborate? The
> > > > compositing output buffer is not affected by this patchset. Only the input
> > > > frambuffers of the planes. Those are shadow buffers. AFAICT the composer
> > > > code memcpy's the primary plane and then blends the other planes on top.
> > > > Supporting transformation of the primary plane doesn't really change much
> > > > wrt to the vmaping of input fbs.
> > > 
> > > Yeah that's the current implementation, because that's easier. But
> > > fundamentally we don't need a copy of the input shadow plane, we need a
> > > scratch area that's sized for the crtc.
> > 
> > Maybe I'm missing something, but I am not sure the relevance for vkms to
> > switch to shadow-buffered plane. (?)
> 
> It replaces the vkms code with shared code. Nothing else. For the shared
> shadow-buffer code it means more testing. If vkms ever supports color
> formats that use multiple planes, the new code will be ready.
Hi,

lgtm.

For debug history, can you please include in the description of the
third patch (shadow-plane helpers to prepare fb) that vmap failure is no
longer displayed in the execution some IGT kms_flip testcases?

For the series:
Reviewed-by: Melissa Wen <melissa.srw@gmail.com>

Thanks,
Melissa
> 
> Best regards
> Thomas
> 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Felix Imendörffer
> 



