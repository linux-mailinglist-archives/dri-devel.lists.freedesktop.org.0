Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25011CD4A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 13:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1E16ED31;
	Thu, 12 Dec 2019 12:36:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 68598 seconds by postgrey-1.36 at gabe;
 Thu, 12 Dec 2019 12:36:01 UTC
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EA66ED31
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 12:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576154160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P7KU0yGpqd+gtXQ7PVameYcgn/rvwEa3g3YEzOaHUqM=;
 b=irhT0fJf01PpLYtwUGGjmA2OtMD29eZlM83IKK682OksDD+wNUe+/7ROQveSHsvQZwNN1k
 s4UU7yGoJGa1lfIYBDcC4h1r0VTrW+dIG8cS3+XHKOf/mY5XArZ1NrBOhYKoE/VRZmSGFi
 mqtzpKvyASuCRgQo0tYGHVUyehoHQeA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-i9V3NjGkMQGitCCEL6Cu8w-1; Thu, 12 Dec 2019 07:35:58 -0500
Received: by mail-wr1-f72.google.com with SMTP id f15so988452wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 04:35:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P7KU0yGpqd+gtXQ7PVameYcgn/rvwEa3g3YEzOaHUqM=;
 b=Kl1O8pq97Wug26QVYsQ4j/RdLW5QtQmRlDsY/bE9DW5Lrqx6DoazW1FKVc1x9uFIQs
 12gX5q6Rlr47A0bKRpRnCQQzfYkdvZmPDXx+Wrwp70sZjWeDrWGb5IciUYG/sPc73CWL
 WT1Q3fZx+DGBMBouxgbBJYKrfr50qYaFOZkZiJ7MJj9nWfP8BNXD2B1gphfwYum/uFYf
 D/52cDLzDPNA0pcz1hnN39E95/LpgGzd3D7FhyyQY37+H9NvZw5cnz0EX96YwP8IqXiD
 OXbF7R391/dXCGw1ZyHBwbCg4M3F/9nZTBbpDskycRCYbwqFJOCeGFBBMJ2sCBKvJ6sn
 7crg==
X-Gm-Message-State: APjAAAXgtUGUh6Ye88kIFykNrCzw7/oGNPZoPurAEaPmUMzxZr5A2U0v
 soCikFLGtgpbHY573lJtMD2wMIVmpwdGeP3ovTBdV6xsCu/u9yg64Biyt4D3q5j61KjncNjx5qZ
 FTJkaee/Q1tH3A/Qb5UgTaGS4tKkt
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr6522517wrr.266.1576154157708; 
 Thu, 12 Dec 2019 04:35:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxxqa0QtuibXmsZ3mhtFZnBl7CO5d4j1nkjzcJUvAG+Y6HI662ZmVrAU5ebtjXiuk4TPaDHQ==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr6522495wrr.266.1576154157447; 
 Thu, 12 Dec 2019 04:35:57 -0800 (PST)
Received: from shalem.localdomain
 (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
 by smtp.gmail.com with ESMTPSA id j130sm1105398wmb.18.2019.12.12.04.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:35:56 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the drm-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20191212225202.04d0d0e7@canb.auug.org.au>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2dd7955d-5477-d110-9409-1c42444ac03d@redhat.com>
Date: Thu, 12 Dec 2019 13:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212225202.04d0d0e7@canb.auug.org.au>
Content-Language: en-US
X-MC-Unique: i9V3NjGkMQGitCCEL6Cu8w-1
X-Mimecast-Spam-Score: 0
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12-12-2019 12:52, Stephen Rothwell wrote:
> Hi all,
> 
> n commit
> 
>    64d17f25dcad ("drm/nouveau: Fix drm-core using atomic code-paths on pre-nv50 hardware")
> 
> Fixes tag
> 
>    Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1706557
> 
> has these problem(s):
> 
>    - No SHA1 recognised
> 
> I haven't seen a Fixes tag with a bug URL before, they usually reference
> the buggy commit.

Sorry my bad, that should have been a BugLink tag. The patch in question is a bugfix,
but it is sorta hard to pinpoint the cause to a specific commit, this problem was
probably introduced during the conversion of nouveau to support atomic modesetting,
which is quite a while ago and involves lots of patches.

Not sure how to best fix this since fixing would require rewriting history. I hope this
is just something we can live with?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
