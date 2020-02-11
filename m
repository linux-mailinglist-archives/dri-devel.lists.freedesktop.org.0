Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BC158DE1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 13:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4DC6EE3F;
	Tue, 11 Feb 2020 12:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A756EA35
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 12:02:29 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id x123so6112645vsc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 04:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g3ftHL8OSjPsuNS32yUzImXKhMO8O2aRd3DUg0/FiaE=;
 b=kxW4/qPYpqG/k99L28c37FKeFJeGoll4wNTeMi5ew669QbI2nsPUGU7soFfSy+p3bB
 u7KmNR0KAs0Ml/K/Izu9n/OqItKvt/jhkcgRRgRuDcFxs00KljQz0NjuA+AbrAkia8lG
 kuAP5Bua4m5LviQo9Scr82xWdeliwUfTUvXznRdQCR7hadmj8UCaso0tAUY3pZHT5R1Z
 C9gudTijMO5GA8V2rbt1VZlxhpRm7UG2oHpoWomSeM4wfEwmfNbTdX4pHI7y2mIathTC
 Dhe4qT0Bqqfrt2MK8+Zn2ifxAXAVBZ/wkIF6Gm23qUX8BxMLDIf750w7T23I0WacNZq+
 3MmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g3ftHL8OSjPsuNS32yUzImXKhMO8O2aRd3DUg0/FiaE=;
 b=hKm/3QK/eWpY5H2bAyzHcL4AKIsulNEMavVNmhy5ipSShUc3Bm8VD4Ms7boMOAv43O
 0BPpXd5rsJRp1pGdXvc5c8BOpZF5aoUeBkZhw9BEoVju4D0v8VSiP3sLNd9Kzufc0jOk
 SUzXJDjDSv59R3UwCY7CVWLmuCPqWFVaAEDcXsyiGZ2Xb3vfwN2oRcLC1BoqGBjD74aX
 XyHsh5CddzWdhc3GP0Y6hMqlxKRiDpG6hncdB+TFNnFlUndTssruduAF2e3CFWChAMJ4
 FXJnd7Gmcrd54nwFCGCvcL5H9JVhL2uYc50z+iUJT19w8R3Hmgj6lZk09QzQa3eGK1oY
 pkaA==
X-Gm-Message-State: APjAAAUtM9PxZvVqVkMky97Y/1y63I4xDVpEkfX9HJZsVNH0+Wy+CfFq
 qmyqkLr/3hYlWLz9T84s44SKTkxUn4qXZ4AoV3trTg==
X-Google-Smtp-Source: APXvYqycjye9QRbLmi3vU1BjsqapFZh2yBO2WdJEJ31g77TfODalZvX345aBvh1/4Tv/fRmLNNh8tKWGtdNM1PCliN8=
X-Received: by 2002:a67:2c4f:: with SMTP id s76mr9357641vss.37.1581422548962; 
 Tue, 11 Feb 2020 04:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20200207141602.4760-1-tzimmermann@suse.de>
 <20200207141602.4760-2-tzimmermann@suse.de>
 <20200207164147.GP43062@phenom.ffwll.local>
 <1cfe7ae4-0ea9-d2f6-6c7b-4a4714519702@suse.de>
In-Reply-To: <1cfe7ae4-0ea9-d2f6-6c7b-4a4714519702@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 11 Feb 2020 12:02:33 +0000
Message-ID: <CACvgo50eaQAh7oXQqoP6=NS3NfH83e4Q7e69PS7T_u0SvSDj-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/udl: Clear struct drm_connector_funcs.dpms
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Dave Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Feb 2020 at 08:10, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 07.02.20 um 17:41 schrieb Daniel Vetter:
> > On Fri, Feb 07, 2020 at 03:16:02PM +0100, Thomas Zimmermann wrote:
> >> Atomic modesetting doesn't use struct drm_connector_funcs.dpms and
> >> the set function, drm_helper_connector_dpms(), wouldn't support it
> >> anyway. So keep the pointer to NULL.
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >
> > On both patches:
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > I just suggested a drm_mode_config_validate() to Ville in his patch
> > series, which runs in drm_dev_register(). Maybe we could add a check for
> > that for atomic drivers? It's a bit a game of whack-a-mole otherwise :-)
>
> From the 'git grep' I'd say those where the only atomic drivers to set
> the callback. The others where non-atomic ones. OTOH, I recently thought
> on several occasions that this or that behaviour should be enforced at
> least by WARN_ON.
>
Having a WARN_ON was my first idea as I saw these patches fly-by.

Sure it will add some dmesg noise in the very odd corner-case.
At the same time, it will high-light existing and future bugs so that
we can address them promptly.

Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
