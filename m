Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92931A312
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 17:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0471589CA4;
	Fri, 12 Feb 2021 16:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2550F89AA6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 16:47:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id v15so8937352wrx.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QprvEJuF+nfD2ydCNF6Q3BdtFfg1p0zzHMXF8BvwmIc=;
 b=LJhSo62JVcozKOW7EPqNSvJ5tNUxExfN1SlyJHHA9A/ED9y874BbyY5vPOJImCU9cC
 QirF7yyoyk0H459gkSYtjc70iARC1kIs3r3kaoO8O/x9+b6guKxCtbiTpEYmWvABxz6Y
 OIzgUSoOTrdW/b4zfLw6kWjfgb5JQ4bZJPBfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QprvEJuF+nfD2ydCNF6Q3BdtFfg1p0zzHMXF8BvwmIc=;
 b=Cg0bBtR+WwLxNC3XB3QAhCW8uwCmSvpgXBfAe2FdsM9Afalq9/1uFm+wapQ70kXgYY
 U6ed4bA0jqzDo89Dm0unBJSIrS1XjbVBWIvc5J4EX9tOdtoF7cgplDsDNTU6NYRTcxNn
 oQvQpgY91K7rVk9InCLSK6eIpjfgH4nu5ALDunQVqBGk/CZsIE2IuYv9rn7VGQcZKvoi
 kPG5CdQKYgrR6xkrG9DXUhBqndlc7tbTKlqjLXGMoiltiCdeKtdmqjmR+pVcAzJ5T2pz
 NYE98AeU0GKA1e+yQXOzySIWPniRzIXZ0Dpw3Nlvhvnt5FhFgpMbjqfPnAWMZPF50PNi
 AdCw==
X-Gm-Message-State: AOAM532xrMOO/F6kzcfjgekVAPgXKoGIncHQzMxDg4jk5aTp0ly4snM1
 01+vBBi9w781HLARKgxal+gTrQ==
X-Google-Smtp-Source: ABdhPJyX5tEL++58uiXXsNYyG2EC9A2Ba9ZwW2T8D0LyV6xb+XWC4JdLqHY3o+XtLxs57hgXqjKlQw==
X-Received: by 2002:a5d:618e:: with SMTP id j14mr4355198wru.377.1613148419768; 
 Fri, 12 Feb 2021 08:46:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u14sm11674794wro.10.2021.02.12.08.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Feb 2021 08:46:58 -0800 (PST)
Date: Fri, 12 Feb 2021 17:46:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Proposed Changes to Elida-KD35T133 Panel Driver
Message-ID: <YCaxAbctJz5l0N4R@phenom.ffwll.local>
References: <SN6PR06MB53426C7236890DEEDE4EE632A58C9@SN6PR06MB5342.namprd06.prod.outlook.com>
 <484adfab-24b6-f141-fde1-d7acc184a8d1@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <484adfab-24b6-f141-fde1-d7acc184a8d1@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Christopher Morgan <macromorgan@hotmail.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 12, 2021 at 08:16:13AM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 11.02.21 um 18:51 schrieb Christopher Morgan:
> > I'd like to make the following changes to this panel driver.  The first=
 patch is to add rotation support (rotates only the DRM connector at this t=
ime).  The panel is currently rotated 270 degrees in the Odroid Go Advance,=
 and this change allows us to describe that hardware better.
> > =

> > The second patch just fixes a typo.  The panel in question is 3.5 inche=
s in size not 5.5 inches.
> =

> The patches are attached as files. Could you re-send them as inline
> attachments?

Some tips here if there's trouble:

https://dri.freedesktop.org/docs/drm/process/submitting-patches.html#no-mim=
e-no-links-no-compression-no-attachments-just-plain-text

Cheers, Daniel

> =

> Best regards
> Thomas
> =

> > =

> > Thank you.
> > =

> > =

> > =

> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
