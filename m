Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9EA3F8EDE
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 21:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241186E8A6;
	Thu, 26 Aug 2021 19:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8E6E8A8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 19:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630006871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7Jqot4N/Qayt7A2rjb607AsJUlnU76SSuyY/pQ3kLU=;
 b=c3In6+b98vV21o+ilTUThlITrQoLxGUzwcAauv8tf6OyuBDAC91eOL6OJw5wm/DBSKQXeD
 rvUN9BJFes6Lt05gleq1eGDcytCeVv7XkSlz2mmfFUSte8L248v0mNaWUt+YTxROl4889u
 xOjr/yBAkxTpflZmlDvuktF5ppWyJGE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-Wxd9mUCCM5aFKSNUL9AJ-w-1; Thu, 26 Aug 2021 15:41:08 -0400
X-MC-Unique: Wxd9mUCCM5aFKSNUL9AJ-w-1
Received: by mail-qv1-f72.google.com with SMTP id
 u8-20020a0cec880000b029035825559ec4so919847qvo.22
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 12:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=/7Jqot4N/Qayt7A2rjb607AsJUlnU76SSuyY/pQ3kLU=;
 b=ejeFE1c5xLfaKeuOCZeBf7W7r5tBkgvFXASPPJu2osNsu2nX8lMPGbYLb2ZwfNEAHd
 oeNUzEChGmQE1+Zkc1+NEXcK8XqauaSRRv3IKtacHZQuCFS3klhXH7cep91bKg1NcGGh
 eEJVGJGPmoEvHem6+q8VyWENt7ntkZ9A4lEE+D0qjTUz3q7UDQksp0Lu+saUMlTsiZmI
 uqKZ9j4zKTT97kODxiAu5FJJy7CQnjwcMikLUjQq5gNPXIcawztxiJvKbMOizC5jqTTw
 4pVsT+mpXQ+zNhGKOSnjkP2y1BpJkaiB8UHLS4oCt78TalXh9PxkYuJVoJsiM5NBKGmY
 7OXw==
X-Gm-Message-State: AOAM532fr9RMbS+7yeQeCMlWm0sxic3rmrc5KFXx19yA/a7uv5QKGNg9
 7kXuxl+yYT0xZuUy+HfTOepX2MGAHxqEcWir9iZ9uMAGUWkK2NDYWtBhTLnU8WK2Lo1uk0m6jbF
 h6lEjlL4xCXlQVfbfmx1gM9jSh0VC
X-Received: by 2002:ad4:522c:: with SMTP id r12mr5969860qvq.17.1630006867625; 
 Thu, 26 Aug 2021 12:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBHmlRljPw4HCd1c8Zi5l++1qxcoNpX8vwFeoACBokTeoH6kE/rGulbUAyi9gltUumCpla1A==
X-Received: by 2002:ad4:522c:: with SMTP id r12mr5969832qvq.17.1630006867271; 
 Thu, 26 Aug 2021 12:41:07 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id x25sm2458938qtj.77.2021.08.26.12.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:41:06 -0700 (PDT)
Message-ID: <76e484cc5146e2ffd63aecff1e6bdb2803a772a0.camel@redhat.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/dp: use more of the extended
 receiver cap
From: Lyude Paul <lyude@redhat.com>
To: Jani Nikula <jani.nikula@intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Manasi
 Navare <manasi.d.navare@intel.com>
Date: Thu, 26 Aug 2021 15:41:05 -0400
In-Reply-To: <87lf4ocvfn.fsf@intel.com>
References: <cover.1628851334.git.jani.nikula@intel.com>
 <ab2ca82226fd954a61a5674cf0531508bd18cef7.1628851334.git.jani.nikula@intel.com>
 <YR6R6oveiFbF8xmg@intel.com> <87eeahegw0.fsf@intel.com>
 <87lf4ocvfn.fsf@intel.com>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 2021-08-26 at 14:11 +0300, Jani Nikula wrote:
> On Wed, 25 Aug 2021, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Thu, 19 Aug 2021, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > > On Fri, Aug 13, 2021 at 01:43:20PM +0300, Jani Nikula wrote:
> > > > Extend the use of extended receiver cap at 0x2200 to cover
> > > > MAIN_LINK_CHANNEL_CODING_CAP in 0x2206, in case an implementation
> > > > hides
> > > > the DP 2.0 128b/132b channel encoding cap.
> > > > 
> > > > Cc: Manasi Navare <manasi.d.navare@intel.com>
> > > > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_dp_helper.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_dp_helper.c
> > > > b/drivers/gpu/drm/drm_dp_helper.c
> > > > index 9b2a2961fca8..9389f92cb944 100644
> > > > --- a/drivers/gpu/drm/drm_dp_helper.c
> > > > +++ b/drivers/gpu/drm/drm_dp_helper.c
> > > > @@ -608,7 +608,7 @@ static u8 drm_dp_downstream_port_count(const u8
> > > > dpcd[DP_RECEIVER_CAP_SIZE])
> > > >  static int drm_dp_read_extended_dpcd_caps(struct drm_dp_aux *aux,
> > > >                                           u8
> > > > dpcd[DP_RECEIVER_CAP_SIZE])
> > > >  {
> > > > -       u8 dpcd_ext[6];
> > > > +       u8 dpcd_ext[DP_MAIN_LINK_CHANNEL_CODING + 1];
> > > 
> > > Why are we even reading less of this than the normal receiver caps?
> > 
> > Good question. I forget my reasoning to only extend to what might affect
> > this use case. Should we extend to the size of the usual receiver caps?
> 
> Ah, there was a previous discussion [1] with Lyude (Cc'd).

Yeah - basically the problem is that we just need to make sure we take care to
avoid clearing info from the non-extended DPCD by accident. Extending this to
7 bits should be fine.

JFYI reading back at your comments it sounds like we might actually be safe to
read the entire DPCD, but we need to make sure we take care to avoid
accidentally replacing the main DPCD with a zeroed-out DPCD which could happen
on systems that have no support for extended DPCDs.

(Also - super bonus points if you can write a unit test to confirm we're not
overwriting the original DPCD! I don't know how much effort this would be
though so don't worry about it too much)

> 
> BR,
> Jani.
> 
> 
> [1]
> https://patchwork.freedesktop.org/patch/msgid/20200901123226.4177-1-jani.nikula@intel.com
> 
> 
> > 
> > BR,
> > Jani.
> > 
> > 
> > > 
> > > >         int ret;
> > > >  
> > > >         /*
> > > > -- 
> > > > 2.20.1
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

