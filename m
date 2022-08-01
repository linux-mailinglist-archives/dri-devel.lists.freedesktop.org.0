Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1158725E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 22:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E6B18BADA;
	Mon,  1 Aug 2022 20:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB4510E04B
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659385952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CWEZNuzIJoR+q1sYn03J7bYwLf50rBAjSt8k3guYFUc=;
 b=WhE1tl6qORvWAiuxsiAv6CNXI1iotXxNw0VA0eiXVn0q5wZeUvA/CAp5hcY2WvkvLwnHZx
 3++0rsSHWKzCu3orOiQACJuAVTH+MSBcr0YdJiZUGdCBxA/0qfb1mezlGxPqG8x04ElyvF
 c8QC3c5toj0wRk3p18RWJKHGIw87LuQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-AfnNNft8PSSSRjtfCsxFzw-1; Mon, 01 Aug 2022 16:32:31 -0400
X-MC-Unique: AfnNNft8PSSSRjtfCsxFzw-1
Received: by mail-qk1-f198.google.com with SMTP id
 s9-20020a05620a254900b006b54dd4d6deso10004059qko.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 13:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=CWEZNuzIJoR+q1sYn03J7bYwLf50rBAjSt8k3guYFUc=;
 b=PwxR3Q7pIWNIdEHvtvz55+Vwari2v8CjTpB1V3UW7XZCUv9RHK2iJbrkV/mTikOzCS
 5V2LjzisvALedSdpQLFT29QRbg1nYRUP5OATG5OLcz1rCI5gts+KEKo9dzik+iad4AJk
 wnkkOajNBB1Oq5F0MQTP1LyYvUt3wrquxkJlrTwzIU5lrao333nDzoIMnNGp8nW4+cgo
 1be4Ye+It+zrGPussvLY0RrxzGUEfzMPx8ayCcWPS9XaNH7icRN5Mg8Z+5RrGjpgrF11
 kRxtaxfKloiO58z9pzIzDHES4SLwuY3fnwDTJ9WtLu3Jrb3WNjUsxcZOyi4zEc+UMamH
 AEWQ==
X-Gm-Message-State: AJIora8/WrDeY8hQJsLjFWd5h/cLd0S3+Bk/ruZkfkSR2X0Fyeto3+/a
 i9AJZmHXUDlN24ozPETeWCGOXA73SxAA1aUdpRDDF8R3d2J4N1xFxOL7OsCbegVEYvHs9WcjTV+
 4kUcn/Jf9HXuSol3wXkPqqhim4FZt
X-Received: by 2002:ac8:5dd1:0:b0:320:94bd:a683 with SMTP id
 e17-20020ac85dd1000000b0032094bda683mr14163400qtx.283.1659385951240; 
 Mon, 01 Aug 2022 13:32:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uvF11KKDbskTO43lEnmnNVZqQbzFKTZQAlWcuVEaQ/m80sUCqfIHd0/dZtHUajMj6B22Y00Q==
X-Received: by 2002:ac8:5dd1:0:b0:320:94bd:a683 with SMTP id
 e17-20020ac85dd1000000b0032094bda683mr14163381qtx.283.1659385950877; 
 Mon, 01 Aug 2022 13:32:30 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 y25-20020a37f619000000b006b5e3bf0eb8sm8882305qkj.19.2022.08.01.13.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 13:32:29 -0700 (PDT)
Message-ID: <ebdfdf0638e9b1ef7ee293eaa2d3fb4e34b94213.camel@redhat.com>
Subject: Re: [RFC PATCH] drm: hide unregistered connectors from GETCONNECTOR
 IOCTL
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Date: Mon, 01 Aug 2022 16:32:29 -0400
In-Reply-To: <20220801133754.461037-1-contact@emersion.fr>
References: <20220801133754.461037-1-contact@emersion.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yikes! Surprised this wasn't noticed until now. This lgtm:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2022-08-01 at 13:38 +0000, Simon Ser wrote:
> When registering a connector, the kernel sends a hotplug uevent in
> drm_connector_register(). When unregistering a connector, drivers
> are expected to send a uevent as well. However, user-space has no way
> to figure out that the connector isn't registered anymore: it'll still
> be reported in GETCONNECTOR IOCTLs.
> 
> The documentation for DRM_CONNECTOR_UNREGISTERED states:
> 
> > The connector […] has since been unregistered and removed from
> > userspace, or the connector was unregistered before it had a chance
> > to be exposed to userspace
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_mode_config.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c
> b/drivers/gpu/drm/drm_mode_config.c
> index 688c8afe0bf1..939d621c9ad4 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -151,6 +151,9 @@ int drm_mode_getresources(struct drm_device *dev, void
> *data,
>         count = 0;
>         connector_id = u64_to_user_ptr(card_res->connector_id_ptr);
>         drm_for_each_connector_iter(connector, &conn_iter) {
> +               if (connector->registration_state !=
> DRM_CONNECTOR_REGISTERED)
> +                       continue;
> +
>                 /* only expose writeback connectors if userspace understands
> them */
>                 if (!file_priv->writeback_connectors &&
>                     (connector->connector_type ==
> DRM_MODE_CONNECTOR_WRITEBACK))

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

