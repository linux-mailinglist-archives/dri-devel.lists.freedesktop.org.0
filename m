Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECF5615533
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 23:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E9410E432;
	Tue,  1 Nov 2022 22:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19A010E432
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Nov 2022 22:41:56 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so301689pjk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Nov 2022 15:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=549rWF/Cs3zs/38lC9NGwtRSOQOXjmIrrlVQub1z2o8=;
 b=X8yNsPnmPfT3SN6GNaL+qXXP6PlWP+tNfOepu9Waku/e8TbMh5Teg/RoEAaxBvZAyp
 86MoLHZvivJ51VxIIlJcdpz/F5d7/wyZli/YZPlxZeL30msR5HHRyHoxNWtQDgse6TbY
 lBpkMDv9gA8YENbSvr5jeWlK6hF7bphcC4SUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=549rWF/Cs3zs/38lC9NGwtRSOQOXjmIrrlVQub1z2o8=;
 b=bdJPqFyoex+4CqPkiW44h98PZqEiiIG/uUtTtpcMVtGaWvUYO0byd1V3sWeKAMtSBb
 poq4uHvFuMF/Yc8gYdFGgTcyeg0Tir/fjSiDpExFQRqmaIWTDwpLV0dOCnMzOsuQGWgF
 oulhrrL8QL0TzqJfNPBXWoiiITo5H0Sx1+lrL0mqdf+7pgPegqNHzZKAXz5daXptNtoT
 h0c1LASugPX68uOsJrLFkxrSaGixuRf52RfYKLf3vZ1l0ZTcgIIR+isqoR6Hgr8wGn9I
 qkZ/qnP/gFWOGmpVVhPxyHMOhv06zbqugILiZ8Gbs6cpZT14tcj67KSu+EfqIM2MR1Fm
 F+pQ==
X-Gm-Message-State: ACrzQf0C0T6eWpTWMngImn/v6DEHOdHnc24Rpq1zpJtPGowscPF768ZA
 k3eR3SmxIyqE8LX8n8KdkpNWlA==
X-Google-Smtp-Source: AMsMyM5ebbfmmxQLSRv1+X29/5hLVS8lb8HR1kl72PW5ICE/mOVinx4Zw3IXtyUk1+PYEjtzhsFvlg==
X-Received: by 2002:a17:90b:4d0e:b0:1f7:ae99:4d7f with SMTP id
 mw14-20020a17090b4d0e00b001f7ae994d7fmr38881630pjb.200.1667342516227; 
 Tue, 01 Nov 2022 15:41:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b138-20020a621b90000000b0056bc742d21esm7194023pfb.176.2022.11.01.15.41.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 15:41:55 -0700 (PDT)
Date: Tue, 1 Nov 2022 15:41:54 -0700
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH v2] [next] drm/radeon: Replace one-element array with
 flexible-array member
Message-ID: <202211011538.B7548FDDE@keescook>
References: <Y1trhRE3nK5iAY6q@mail.google.com>
 <Y1yetX1CHsr+fibp@mail.google.com>
 <CADnq5_Mod90O=tN26+Yi74WPYxpVtss+LG_+_HZyFv2EtzR+MA@mail.gmail.com>
 <202211011443.7BDB243D8D@keescook>
 <CADnq5_Ou9HnZjQx5WaAZW+iu24g_eS2hh25xhExeQjdMOXYfCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADnq5_Ou9HnZjQx5WaAZW+iu24g_eS2hh25xhExeQjdMOXYfCQ@mail.gmail.com>
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
Cc: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 06:09:16PM -0400, Alex Deucher wrote:
> On Tue, Nov 1, 2022 at 5:54 PM Kees Cook <keescook@chromium.org> wrote:
> > Does the ROM always only have a single byte there? This seems unlikely
> > given the member "ucFakeEDIDLength" (and the code below).
> 
> I'm not sure.  I'm mostly concerned about this:
>
>             record += fake_edid_record->ucFakeEDIDLength ?
>                       fake_edid_record->ucFakeEDIDLength + 2 :
>                       sizeof(ATOM_FAKE_EDID_PATCH_RECORD);

But this is exactly what the code currently does, as noted in the commit
log: "It's worth mentioning that doing a build before/after this patch
results in no binary output differences.

> Presumably the record should only exist if ucFakeEDIDLength is non 0,
> but I don't know if there are some OEMs out there that just included
> an empty record for some reason.  Maybe the code is wrong today and
> there are some OEMs that include it and the array is already size 0.
> In that case, Paulo's original patches are probably more correct.

Right, but if true, that seems to be a distinctly separate bug fix?

-- 
Kees Cook
