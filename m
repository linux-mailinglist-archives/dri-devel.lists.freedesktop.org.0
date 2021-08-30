Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664DC3FBAA6
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 19:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5691689CB8;
	Mon, 30 Aug 2021 17:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41B489CB8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 17:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630343332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJ2p1fjjD8ERbYVIX3Rp+Pa17H7hfIARQi230Atxhhs=;
 b=bYYR3LBHXovkIH+e0odd/L27InpuCJ5NZru0AtEfon2YHshEnQ4OZP46PFvfR2jRVa9qRh
 2GiRZRBsKqxlfvPzfu9QsMxBS5jxx7Ra43UqnwWpTgE4plcVHpUzMv6F1KXfFr0dDqgps5
 YLSADc0MoS+bda6023BH2pHFPRuvvdw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-lb9Ml2J1OLKjOpq9CWN-Mg-1; Mon, 30 Aug 2021 13:08:49 -0400
X-MC-Unique: lb9Ml2J1OLKjOpq9CWN-Mg-1
Received: by mail-qk1-f198.google.com with SMTP id
 h10-20020a05620a284a00b003d30e8c8cb5so1197977qkp.11
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 10:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=RJ2p1fjjD8ERbYVIX3Rp+Pa17H7hfIARQi230Atxhhs=;
 b=fYuP8iyoJ+ofZDTFOjpYKN0q49toHJ0NxgGUVg/PYg/u24JPzcxu/9z/QVhIazS/I5
 Ccc3236T6lpilDkHp1Z1/WrugjLGAvfJ2wMvuHS+jCYgk5umetVYEDc0clGMLqtXc/XS
 kHIHSs/zxKtT2AdSVFwZLMhdNOloKq7wbOY8eeKTLZmp012llaUzhFNnw21g6R21iENv
 IT89AmDc+xYqApua36eRNrovT4ArJQBzAsnDX7o0C6mC/OKX1kD6Zzr9sBUUj/dZqOTT
 1v4XydjqaFa12ZxA0voYZ/Em0duM3hhHgTHPsdVgLF8tdvzwEngRxujraIAwv8oQOVWk
 NAiQ==
X-Gm-Message-State: AOAM532Jgjm7cGzBZhB2EEe6o/snD/1CWdomRqjSxPerbtk4+K/oqYWC
 6n3m29RSrw3onkl0ZCPgpQUuyxr5Fx9dRnStcPRrIWMAYYXw8hK2Vyvjddz6Vnww7EBjuDrguYu
 ZuSiF+YO6VatE9SFbDqWGTfQev4Ck
X-Received: by 2002:a05:620a:81d:: with SMTP id
 s29mr23761968qks.301.1630343329147; 
 Mon, 30 Aug 2021 10:08:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/+cPlJFfzxjZYDasfknZytxGolZm+T7/j6hx198c4EYh9UytMtKYed3Gms4R3lAi7g+R6nQ==
X-Received: by 2002:a05:620a:81d:: with SMTP id
 s29mr23761951qks.301.1630343328961; 
 Mon, 30 Aug 2021 10:08:48 -0700 (PDT)
Received: from [192.168.8.104] (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id g7sm8835996qtj.28.2021.08.30.10.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 10:08:48 -0700 (PDT)
Message-ID: <c0e64fb9332b03c920de05be4c4c27f916ff6534.camel@redhat.com>
Subject: Re: [PATCH AUTOSEL 5.13 20/26] drm/nouveau: recognise GA107
From: Lyude Paul <lyude@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ben Skeggs
 <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org
Date: Mon, 30 Aug 2021 13:08:47 -0400
In-Reply-To: <YSzMR4FnrnT5gjbe@sashalap>
References: <20210824005356.630888-1-sashal@kernel.org>
 <20210824005356.630888-20-sashal@kernel.org>
 <6607dde4207eb7ad1666b131c86f60a57a2a193c.camel@redhat.com>
 <YSzMR4FnrnT5gjbe@sashalap>
Organization: Red Hat
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34)
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

ahhh-ok, that makes these patchs make a bit more sense then. If Ben doesn't
have any objections I'd say these are fine to backport then

On Mon, 2021-08-30 at 08:17 -0400, Sasha Levin wrote:
> On Tue, Aug 24, 2021 at 01:08:28PM -0400, Lyude Paul wrote:
> > This is more hardware enablement, I'm not sure this should be going into
> > stable either. Ben?
> 
> We take this sort of hardware enablement patches (where the platform
> code is already there, and we just add quirks/ids/etc.
> 

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

