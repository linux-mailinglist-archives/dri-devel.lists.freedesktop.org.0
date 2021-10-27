Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556CC43CEDF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 18:43:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D596E8C9;
	Wed, 27 Oct 2021 16:43:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844D66E8C9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635353003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c30nzXdREXt5rxXNkNX564x/1HSSK2aOOmV7DPqFhVA=;
 b=YBiBcMeoxjvTOb99KXe3LaUy47zlLgSyPwhlEA6XOi+zixp4ijNghdEh58froc6ZQw1YFM
 SRQxEHNRv/Pqai78R5V6Xq+NjpDbTvpZ4PJTg+EhFOoxAT9NqtwfX9r47itoUbpaWt79od
 Oyk8qM1EEgHjE9JOuCvi9YbNfnyHKEM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-6VAh_JQcOsCK0klSb5r10Q-1; Wed, 27 Oct 2021 12:43:17 -0400
X-MC-Unique: 6VAh_JQcOsCK0klSb5r10Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 k1-20020ac80c01000000b002a79e319399so2316104qti.8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 09:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=c30nzXdREXt5rxXNkNX564x/1HSSK2aOOmV7DPqFhVA=;
 b=S1SU8lit+wZZzgZ0gLSgZB/7/rsAKuKFrkBu23E+cZTeBJL4zEEOww6q9B/IxTkdYr
 XkYNf/02kLjdtPyiTPzlfNtkmZDScNMHcNkUi9JxUiVIrpFRJxkMcmmnsIJgNbDn9FxL
 4nmfAoJg/sw7Zo8IN+OOOJ6gq7r3GF51j9ekD88lMewdT7cB+TB3JXxNf+xgtaJ1Tv4i
 8/l0HUZ22GZrqCWV92NzawpAlG9xxT6giEcSwTz+OpmoRgYXWpI0bT8hN213LEY98InB
 wuQdX3EcnUdUhBWEP7ELdUI89qKQqblxOuQ7Nvnp1/nDQu3VQCY/A8oA1bGlMqeynOIr
 /ROA==
X-Gm-Message-State: AOAM530yY0e1vV1KMTwymz6b69jcO9NTftt0jdtL6aFkUBhu/T5uHpB9
 LODtAwVXM118pk5S15w/n1w2cv1fH4oZsp/4nic+G98edgsqaj1kUZEMf4opf7yy3sqzYoHn79l
 wzfyQG2mdSNMHlXGEXRORD6hhWbi+
X-Received: by 2002:a05:620a:4612:: with SMTP id
 br18mr24777851qkb.405.1635352997385; 
 Wed, 27 Oct 2021 09:43:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB0wg1Dg9vs+mnsyvRxjN8++03dorSM8Tx9qUizN6upDs9ZEWOzdWPdgO5vcm+7na5URcMHQ==
X-Received: by 2002:a05:620a:4612:: with SMTP id
 br18mr24777828qkb.405.1635352997187; 
 Wed, 27 Oct 2021 09:43:17 -0700 (PDT)
Received: from [192.168.8.138] (pool-96-230-249-157.bstnma.fios.verizon.net.
 [96.230.249.157])
 by smtp.gmail.com with ESMTPSA id t22sm258683qtw.21.2021.10.27.09.43.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 09:43:16 -0700 (PDT)
Message-ID: <9f41102728115cf7683d148d249f937bddaf8372.camel@redhat.com>
Subject: Re: [PULL] topic/amdgpu-dp2.0-mst
From: Lyude Paul <lyude@redhat.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Date: Wed, 27 Oct 2021 12:43:15 -0400
In-Reply-To: <20211027071816.64ntgyzdvnbotabb@gilmour>
References: <e0e3cb4ea8b6f2d08e8d07a2ad3b25a2dca4570e.camel@redhat.com>
 <20211027071816.64ntgyzdvnbotabb@gilmour>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was for airlied to pull into drm-next

On Wed, 2021-10-27 at 09:18 +0200, Maxime Ripard wrote:
> Hi Lyude,
> 
> On Mon, Oct 25, 2021 at 09:30:14PM -0400, Lyude Paul wrote:
> > topic/amdgpu-dp2.0-mst-2021-10-25:
> > UAPI Changes:
> > Nope!
> > 
> > Cross-subsystem Changes:
> > drm_dp_update_payload_part1() takes a new argument for specifying what the
> > VCPI slot start is
> > 
> > Core Changes:
> > Make the DP MST helpers aware of the current starting VCPI slot/VCPI total
> > slot count...
> > 
> > Driver Changes:
> > ...and then add support for taking advantage of this for 128b/132b links
> > on DP
> > 2.0 for amdgpu
> 
> It's not really clear to me what branch it should be pulled in? is it
> for drm-misc-next?
> 
> Thanks!
> Maxime

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

