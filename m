Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D888A44B1BD
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 18:06:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279AB899D4;
	Tue,  9 Nov 2021 17:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3625 seconds by postgrey-1.36 at gabe;
 Tue, 09 Nov 2021 17:06:10 UTC
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B2689875
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 17:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=HKqZVUTyITTKjgy2bSV7h4abqd5N6tsdpToL4Lb0mKc=; b=H8ql07RS6piKTYWXNOfWTdpkkI
 9n8BDWQQ1nsQZoC5SeD7NjjH2LXk+JRkDjgdg6YR9P+TqS7YfhSe/BHY+uC0MMwUdh9AE8NTrPaDh
 m0YDJ0MKqLAd7ATFMlPnLkrcog1fyVnECSwYLLRlUHzdjcYIZP+Heu9fF+yEqgXGzub5e5JUKysPz
 dDRpLAQfs2H6weChGw6eP5gAtkvsrqyWG2Lb/gifx5h98xnFxsdSvo0ZBi52ntxcca3XRM8tiJyQ4
 qJzHjAa2DD3RuueA5e1TeHlOcPws/QXlTnqG6Ji+sH5N0eNBXiXj2zL8Fl2p35ITFLrq4zCzt2LX/
 PZVwBsZw==;
Received: from merlin.infradead.org ([2001:8b0:10b:1234::107])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkTd0-00F5oh-JA
 for dri-devel@lists.freedesktop.org; Tue, 09 Nov 2021 16:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=HKqZVUTyITTKjgy2bSV7h4abqd5N6tsdpToL4Lb0mKc=; b=Xz8Jhef9yQSyM4bHzlcdA32i3e
 PyDBMANcwcbhPo4zFx69oE+cnWHgIViH/8GIUv8YiGxaB0YbY/9NzMUSgXLunYsidm8W9hZfm5jxT
 MfoNs4YehQA8Hvr0jkp10nf/fGIHnDH2nLPBhfXg8ZoI6rAWZewXPs3fiCdVLtVxKN5qCHrwfIOzk
 yq0kZIcFl+vUn3B9ZBT2/6PFjHV0JN+xkmJa4IjniApZyP05znVwVu66ZRPgfy1manp4ctHepA1HP
 rwCjUHGioV1FU3XaiSSKqeWv7ks6TZUzjFhRDsG9qPSfSrGrU51mcuKSG3iEoXeLJ8kHeqfNT//og
 +fgVl8cw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by merlin.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkTcl-008nze-Vs; Tue, 09 Nov 2021 16:05:28 +0000
Subject: Re: AUTOSEL series truncated was -- Re: [PATCH AUTOSEL 5.15 001/146]
 dma-buf: WARN on dmabuf release with pending attachments
To: Pavel Machek <pavel@ucw.cz>, Sasha Levin <sashal@kernel.org>
References: <20211108174453.1187052-1-sashal@kernel.org>
 <20211109075423.GA16766@amd>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3957633e-9596-e329-c79b-b45e9993d139@infradead.org>
Date: Tue, 9 Nov 2021 08:05:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109075423.GA16766@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Charan Teja Reddy <charante@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/8/21 11:54 PM, Pavel Machek wrote:
> Hi!
> 
> This series is truncated .. I only got first patches. Similary, 5.10
> series is truncated, [PATCH AUTOSEL 5.10 035/101] media: s5p-mfc: Add
> checking to s5p_mfc_probe... is last one I got.
> 
> I got all the patches before that, so I believe it is not problem on
> my side, but I'd not mind someone confirming they are seeing the same
> problem...

Yes, several of the patch series were incomplete for me also...

-- 
~Randy
