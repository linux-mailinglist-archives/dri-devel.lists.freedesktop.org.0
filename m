Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 795572731B3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 20:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C006E519;
	Mon, 21 Sep 2020 18:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A490A6E51A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 18:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600712003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8F5wpeF1GBgsrB1xCZMnCrLJFZZfmfwKArOQA+2WnqI=;
 b=biJYtNK7NI6DvPVu/K2eglfCQfOOJ29XDij8dJp4/U2F6e4n3+GJ0EUqOD9Npk+8ITw14Z
 ZixpAT0EKXBCWnHK/1zX4q/cgydtWCWeoAjLEMKEsro50YRULLSbyxZ5qrXaSGws2i1cX3
 NQN01gX/HZadObERKhszRra3eavAUYg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-W50YUGazOaa1N8Afu7k-og-1; Mon, 21 Sep 2020 14:13:22 -0400
X-MC-Unique: W50YUGazOaa1N8Afu7k-og-1
Received: by mail-qt1-f199.google.com with SMTP id r22so13668953qtc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 11:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=8F5wpeF1GBgsrB1xCZMnCrLJFZZfmfwKArOQA+2WnqI=;
 b=n+sKkAoEtigTBth4tcvdu9soCee4HJMpg6zZREVeRBOy2nqr64BlNqvIUu9gz43Wv5
 gP9d7b768B4pr5qpH9GIZ6aEvA4QKqqjPjcVLLgLsBD7+jOLyLpwexoqmz+IygkzWdel
 Lfz39d0vPDGo50MWbDtRqdg6pmx0DOoBoYrgKaaN5OWmQjiD2nzomGBGKnXReZKDyvey
 KGOjD+aQ3ATJWrG2b+5PnzDvmSYtxyLPH4SbFI/wBwAK48Ltn7hnR3B7R3d0cgM1CKb6
 BGld5ImCsbMGTBYNbPWtTt4n79lu7DNt8MkhGo+w52UD1KSf2reNc44BXwsZvLjCpjXV
 dlHg==
X-Gm-Message-State: AOAM5304MqS1Zq0lJDj9ff2dDvJRATGhz7tNP9ieFO3GY/ej9k+NxRP3
 GmcX9D1iM4/xT/oWIS2Y/KQPaMh1qZGpyGVoxuLfDJf5xr9lYwNlos5ZPoSlrpjksVEPn3KTemQ
 IC1Gvk7qJJqvB8DJnmeHUL4t4QooK
X-Received: by 2002:ad4:42a5:: with SMTP id e5mr1294634qvr.58.1600712001528;
 Mon, 21 Sep 2020 11:13:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4HmD2czcEycYpzXGKM90KRmi9nizWQSnFZMEaNWx8kqZgIP1iydPcYOGb8uZXRLTrWbk4Pw==
X-Received: by 2002:ad4:42a5:: with SMTP id e5mr1294616qvr.58.1600712001308;
 Mon, 21 Sep 2020 11:13:21 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id l21sm9624117qkl.128.2020.09.21.11.13.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 11:13:20 -0700 (PDT)
Message-ID: <3df7f6ec13348537bec5e0736563616e9ed05c28.camel@redhat.com>
Subject: Re: [PATCH] drm/dp: start using more of the extended receiver caps
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Mon, 21 Sep 2020 14:13:19 -0400
In-Reply-To: <87d0354bqi.fsf@intel.com>
References: <20200901123226.4177-1-jani.nikula@intel.com>
 <c4b9aa428ccfa90cb29845f622eba8923eeb2e38.camel@redhat.com>
 <87d0354bqi.fsf@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-09-01 at 21:01 +0300, Jani Nikula wrote:
> On Tue, 01 Sep 2020, Lyude Paul <lyude@redhat.com> wrote:
> > On Tue, 2020-09-01 at 15:32 +0300, Jani Nikula wrote:
> > > In the future, we'll be needing more of the extended receiver capability
> > > field starting at DPCD address 0x2200. (Specifically, we'll need main
> > > link channel coding cap for DP 2.0.) Start using it now to not miss out
> > > later on.
> > > 
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > > 
> > > ---
> > > 
> > > I guess this can be merged after the topic branch to drm-misc-next or
> > > so, but I'd prefer to have this fairly early on to catch any potential
> > > issues.
> > > ---
> > >  drivers/gpu/drm/drm_dp_helper.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > > b/drivers/gpu/drm/drm_dp_helper.c
> > > index 1e7c638873c8..3a3c238452df 100644
> > > --- a/drivers/gpu/drm/drm_dp_helper.c
> > > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > > @@ -436,7 +436,7 @@ static u8 drm_dp_downstream_port_count(const u8
> > > dpcd[DP_RECEIVER_CAP_SIZE])
> > >  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
> > >  					  u8 dpcd[DP_RECEIVER_CAP_SIZE])
> > >  {
> > > -	u8 dpcd_ext[6];
> > > +	u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> > 
> > Not 100% sure this is right? It's not clear at first glance of the 2.0
> > spec, but
> > my assumption would be that on < DP2.0 devices that everything but those
> > first 6
> > bytes are zeroed out in the extended DPRX field. Since we memcpy()
> > dpcd_ext
> > using sizeof(dpcd_ext), we'd potentially end up zeroing out all of the
> > DPCD caps
> > that comes after those 6 bytes.
> 
> Re-reading stuff... AFAICT everything in 0x2200..0x220F should be
> valid. They should match what's in 0x0000..0x000F except for 0x0000,
> 0x0001, and 0x0005, for backwards compatibility.
> 
> Apparently there are no such backwards compatibility concerns with the
> other receiver cap fields then.
> 
> But it gives me an uneasy feeling that many places in the spec refer to
> 0x2200+ even though they should per spec be the same in 0x0000+.
> 
> I guess we can try without the change, and fix later if we hit issues.

I'm fine with the change if it doesn't break things btw - just as long as
we're making sure that we don't zero things out by accident
> 
> 
> BR,
> Jani.
> 
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
