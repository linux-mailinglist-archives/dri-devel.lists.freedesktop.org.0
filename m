Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0376DF86C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 16:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A26D10E83F;
	Wed, 12 Apr 2023 14:28:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA73110E82A
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:28:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f0769b0699so763905e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 07:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1681309682;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0llp1hVKLIkBR+eiPxuvVpVypjNa13pXHpHX4ojYOSk=;
 b=LEtup2zI+Go27zuQCeKXbwPgSnBpl7LgzN5Uup8JIkSKwTIfHXF4Qfs0o2ElhQI/lF
 edS86zXQQ0EUz+9Z4snngUTGfNfkuzCPWVNTBkdujpcpLSCNeNK2zHpc7oaepmetXJOO
 t83iEh/K3JyRtYgZuGN4zk+vCIq7ckQHq3kwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681309682;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0llp1hVKLIkBR+eiPxuvVpVypjNa13pXHpHX4ojYOSk=;
 b=5kU9HIQffbElbsqmb3wSQ/mTMZXwfpNeDo1YSeBElqSDdoL42vlaQhZP9yAKSn8wLr
 RMJQc18Q+nuuBpUrBsT7m9P3d/nyWnu5yxzqh9TzkXVo4aBa5TYPQGKl3Z0lFJPi9ICB
 5lUr9nkF3sKkUtSFsDAkpCEwCUuM3VvAFm/+NlgQj/jMfAMTlKVR8czLhWcCxO8A5DGC
 VJDj5iYimYFOcaZU2hcYfo1+2f7zl57Ki54hVhRpNgEKrD3gSeFa0jkl2TUHLhRCw/kf
 lmk3IzPuz4rzva+Tt8f8RKFscZce2GcKjuWD2RABSM+2Tqo2h3pESMiWivqo+lQnZAB2
 ZUMg==
X-Gm-Message-State: AAQBX9ci6QVlE3i5OOo6B4CY1pDIZuj6a9jtiiOvEBdum3hxwEE9varu
 HQN/jiRUZZC0UUmxSqcevey3Dw==
X-Google-Smtp-Source: AKy350a6TSz2oFDMVECGAL4J0n7ZUey5qJ91v7kVdXBaS8nJuOpQQSUiRgtRoHEURnjxfLnkHH3MNg==
X-Received: by 2002:a05:6000:1148:b0:2f4:a2b3:3ea6 with SMTP id
 d8-20020a056000114800b002f4a2b33ea6mr1273515wrx.6.1681309681941; 
 Wed, 12 Apr 2023 07:28:01 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 f4-20020adff8c4000000b002cff06039d7sm17313882wrq.39.2023.04.12.07.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 07:28:01 -0700 (PDT)
Date: Wed, 12 Apr 2023 16:27:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] Revert "accel/qaic: Add mhi_qaic_cntl"
Message-ID: <ZDa/77pcZyr+W2Be@phenom.ffwll.local>
Mail-Followup-To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 sfr@canb.auug.org.au, greg@kroah.com, ogabbay@kernel.org,
 jacek.lawrynowicz@linux.intel.com, quic_pkanojiy@quicinc.com,
 mani@kernel.org, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org
References: <1681307864-3782-1-git-send-email-quic_jhugo@quicinc.com>
 <4e81bfdc-c20a-9e54-7d1f-40bd9f91c758@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e81bfdc-c20a-9e54-7d1f-40bd9f91c758@quicinc.com>
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
Cc: sfr@canb.auug.org.au, mani@kernel.org, greg@kroah.com, ogabbay@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_pkanojiy@quicinc.com, linux-next@vger.kernel.org,
 jacek.lawrynowicz@linux.intel.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 12, 2023 at 08:00:33AM -0600, Jeffrey Hugo wrote:
> On 4/12/2023 7:57 AM, Jeffrey Hugo wrote:
> > This reverts commit 566fc96198b4bb07ca6806386956669881225271.
> > 
> > This exposes a userspace API that is still under debate.  Revert the
> > change before the uAPI gets exposed to avoid making a mistake.  QAIC is
> > otherwise still functional.
> > 
> > Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
> > ---
> 
> Daniel,
> 
> Assuming you find this acceptable, would you please merge it?
> 
> Sorry, but I'm still working through an internal process for my drm-misc
> commit access.  I anticipate having that resolved prior to future changes.

It should be pushed to drm-misc-next-fixes (but that's not yet ready, I
pinged Maarten).

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Ack from Greg/Oded would be good too for completeness.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
