Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D7958D060
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:09:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63362A6947;
	Mon,  8 Aug 2022 23:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E63A666A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 23:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660000041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTykkjMreZGlPtiHtJZVriJJcrzikHVxhAuXCB1qSxU=;
 b=GJPrdjID4RrT99pF1/+MGkpwb9teDdOVr2vJK9n2EqESVvWK65Kv/xATL3Xkn6cmCUusPq
 P/frmVPGzdHSb7B8qhQqnX2vkQesmLrfpZl9+cwLpGgYowq+C77LdGWYcE3zjcigeRZwck
 amwYQ8MWvwheQxb7sHNzEJeKuWe4F78=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-asD-2gF7PMWYJf5rnc8rmg-1; Mon, 08 Aug 2022 19:07:20 -0400
X-MC-Unique: asD-2gF7PMWYJf5rnc8rmg-1
Received: by mail-qt1-f198.google.com with SMTP id
 hj2-20020a05622a620200b0034286e2a191so7490829qtb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Aug 2022 16:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc;
 bh=VTykkjMreZGlPtiHtJZVriJJcrzikHVxhAuXCB1qSxU=;
 b=FVam/94MyQT507O8Rr0w8G0ai8EnoGy/xUIYJX6ava4OLOfUeB32m4KXTdTkR1U58i
 564SDnv3R/r7L5iDIH+8xocnk2W1M5cl6g8S1gCuZ2szYFrGRO5SATmarQydlzUzflj+
 1yZmGkkEj6KNS6L6PBlNS3cOJN/ZWjC6yf/a+e6HYS1hWUaAzNFL+LJMDK6hqMA6mXEA
 Qjvtb5BNlosKhyUVcCWgBUKj5mUpo8w4Amfit7BGZy2PLY6XqyhS2fEjl03V3oTmcT81
 8V+QzQTOvlNccsp9SaADmP3VV26C3ahx+hugp6MtBibk7BcEhBr/KPZc3Z77DfgRaMQ7
 Gtow==
X-Gm-Message-State: ACgBeo3BqXQkpK+Kl+9xGj6DXnCsyu2q6Wv8a35WC5MYjJHqwDMJPmve
 lvxLpHCuU/1b6fHfSeseMGyxEf5bozDNgxrvP1A/Zfz4A+tyYG65GbKyvxG+gS+wG60138gv522
 B/Ng6bkGNyFL4a6L0pG/uCeXrHdJX
X-Received: by 2002:ac8:5bd3:0:b0:343:3d7:b35e with SMTP id
 b19-20020ac85bd3000000b0034303d7b35emr2847919qtb.684.1660000039783; 
 Mon, 08 Aug 2022 16:07:19 -0700 (PDT)
X-Google-Smtp-Source: AA6agR46tDYlnYw3pgmddX2HjPE1Rbd1ysZz8fH6jnfgN+WWv+32bU9uk9MafWASDaWLB6SisWPYGw==
X-Received: by 2002:ac8:5bd3:0:b0:343:3d7:b35e with SMTP id
 b19-20020ac85bd3000000b0034303d7b35emr2847909qtb.684.1660000039598; 
 Mon, 08 Aug 2022 16:07:19 -0700 (PDT)
Received: from [192.168.8.138] (pool-100-0-245-4.bstnma.fios.verizon.net.
 [100.0.245.4]) by smtp.gmail.com with ESMTPSA id
 bm32-20020a05620a19a000b006b8e63dfffbsm10296141qkb.58.2022.08.08.16.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 16:07:18 -0700 (PDT)
Message-ID: <cab2385388606f3292e55d962a8ddedac0540f2c.camel@redhat.com>
Subject: Re: [RESEND RFC 06/18] drm/display/dp_mst: Add some missing kdocs
 for atomic MST structs
From: Lyude Paul <lyude@redhat.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Date: Mon, 08 Aug 2022 19:07:17 -0400
In-Reply-To: <CO6PR12MB548907FE2E64F8D8CC5D5227FCAD9@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
 <20220607192933.1333228-7-lyude@redhat.com>
 <CO6PR12MB548907FE2E64F8D8CC5D5227FCAD9@CO6PR12MB5489.namprd12.prod.outlook.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Also JFYI - I did see this comment but didn't address it in my respin, but
only because I figured this might be better for a followup patch considering
how much work is already in here

On Wed, 2022-06-15 at 04:43 +0000, Lin, Wayne wrote:
> I would prefer not using the term "available" which is a bit conflicting with
> the idea in the reply of ENUM_PATH_RESOURCES - full PBN & available PBN.
> Maybe better to change to use "full_slots"?
> 
> Not yet finish all the patches. Will try to go through all the patches recently : )

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

