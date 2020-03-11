Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060B181FDC
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 18:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58C56E4D7;
	Wed, 11 Mar 2020 17:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF806E4D7;
 Wed, 11 Mar 2020 17:46:29 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 8so1062671uar.3;
 Wed, 11 Mar 2020 10:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CfYOzO5+uF1CfG+RksBcaJHJ26wXRO4tUkH0iyVEBYg=;
 b=rtMbelEy/cBAVzELTigiCWHImc1Z9n3XaFmfgNcJl2VrT+vyxlYkZ8Ju2FPK/fdCyb
 OUlS4FEOwtin7pqZ4mSgzOgQm3DXVgdIKfGLYhFpvFzVnEsEBIroN2kHOQ7AQY7u1Yf7
 DZ2pulvK5VCS/8pOa0GUx0SfEHDhwelNsZi4AHDlmk0cQG6+Ou7gn4uu1HeAGGcacmeB
 vH05HIiMQdV1B9x5L786OItlIQZLlx51LJp8sJYYqry33aG4NOENkZI90MXCzGWD0++o
 RotNUD71m7HG/r7Ln0dQIVUFWoqjcmuCF+t4ORJX/F87562vagpD8BRAZqiVfEu46J0e
 xa0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CfYOzO5+uF1CfG+RksBcaJHJ26wXRO4tUkH0iyVEBYg=;
 b=DGgHnd540kdIZJXYILHAMCh0XN1iFYnhgmklsHEg2bI9kAsvtOc5RAJrDDSfl+pG/+
 1WVE8lkh97GduDAb6tO8CXB2I/kBRVQ1Wzg3PFxwKKD0CdUZCYwKePljZuCfnRo0VBhq
 VcqkH95OqMGD61D2uyNpkKgj1NJdPGmdhWs6WpkypzIyo9QcEgwzXG8qDElSzBns99HK
 HHKSf14edjqH0Rh01pvu2NrT5xqFBdjz7YGJiJiSYylS9YLmjVfYrjZzChXsNDhiifbz
 We7/DpD37hHcaz6jghKD87IX7I/3P4JJUCoQZzjZcrSQfeUYXqX9MnmpVpFbCRI/huQx
 m49A==
X-Gm-Message-State: ANhLgQ0jgEoayXK6yEuFxxIjb5O6q8i/ECudj/d4i68pAb06TG58t9Db
 MZUBkK4f/jQ6w8aTOvCtJSgouvggeRB/J2hdoXl8r2Okefs=
X-Google-Smtp-Source: ADFU+vsqvuJSIB8B2CTqGmiLrH9JTmJN21JmF4PzOdb1d2H48ALBPeBqLu4uNXCElScPz9lM02jbya/HUEOz6GoCNfk=
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr2417380uae.106.1583948788551; 
 Wed, 11 Mar 2020 10:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200307083023.76498-1-pankaj.laxminarayan.bharadiya@intel.com>
 <9e5fcbcd3f7a4d74b9941a21e0407c6eef79e920.camel@redhat.com>
In-Reply-To: <9e5fcbcd3f7a4d74b9941a21e0407c6eef79e920.camel@redhat.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 11 Mar 2020 17:45:41 +0000
Message-ID: <CACvgo53k3vVqrb42+nZgf=NK-Z1+=uaN30WUMF65fuLDUipyGg@mail.gmail.com>
Subject: Re: [PATCH 0/5] Cleanup drm_dp_mst_topology_cbs hooks
To: Lyude Paul <lyude@redhat.com>
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
Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Mar 2020 at 20:27, Lyude Paul <lyude@redhat.com> wrote:
>
> On Sat, 2020-03-07 at 14:00 +0530, Pankaj Bharadiya wrote:
> > drm_dp_mst_topology_mgr_cbs.register_connector callbacks are identical
> > amongst every driver and don't do anything other than calling
> > drm_connector_register().
> > drm_dp_mst_topology_mgr_cbs.destroy_connector callbacks are identical
> > amongst every driver and don't do anything other than cleaning up the
> > connector((drm_connector_unregister()/drm_connector_put())) except for
> > amdgpu_dm driver where some amdgpu_dm specific code in there.
>
> Yeah that amdgpu destruction code kinda stinks a little bit :\. I think we can
> just drop some of it and move the rest into their connector destruction
> callbacks.
>
> For the whole series:
>         Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> I'm going to go ahead and let the maintainers know I'm going to push this
> (since there's some minor changes here outside of drm-misc), and push this to
> drm-misc-next. Then I'll go and write some patches to remove the leftover amd
> bits and drop the callback for good (I'll cc it to you as well).
>
Thanks for following on these Pankaj.

For the series:
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
