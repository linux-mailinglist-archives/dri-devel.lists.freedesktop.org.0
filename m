Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CCB57E361
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 17:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC1ED11BE34;
	Fri, 22 Jul 2022 15:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30AE011B807;
 Fri, 22 Jul 2022 15:06:59 +0000 (UTC)
Received: from [192.168.178.53] (82-71-8-225.dsl.in-addr.zen.co.uk
 [82.71.8.225])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbeckett)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 51B6F6601ACC;
 Fri, 22 Jul 2022 16:06:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1658502417;
 bh=talAFwKKsaOv9iY2eGoXpz6PwEbul7ITq/1xEmofP3I=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Sea40vgUTv/2odG8rMIWpOXdJwGZxjpHbdjjPbIlHeG4/UuNgRz0wAQmeQmtzc8g0
 0SdX1O0A9MMzT7I8lvDwt1ZnVp5mMwaZKxGOHZKP7csI5d2BiNHfEszXz+GXwWhR42
 tCxoG7NgynEIUIVto0T04imAzh8g1aq7o/xUUhq+SDjRiSQP9aWSxYNsaE1524zfyg
 vtEiwFj8kKBiVIMavZ0MDU14sIIfilNR8v25pKo6YLTNVwxQCD+s8Vw8Ir1iVvLcOK
 uEc8QMgXst2mWYKrK4Wg1fFt7YiIQnuRHyaDM3u8xle+rGs5Q6S+n+MJkQuAXSVvn6
 /jaJUQDrYz93Q==
Message-ID: <1b35338a-e189-2134-5c87-e2f2edc54cee@collabora.com>
Date: Fri, 22 Jul 2022 16:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drm/i915: stop using swiotlb
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220722145920.1513509-1-bob.beckett@collabora.com>
 <20220722150358.GA7152@lst.de>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <20220722150358.GA7152@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 22/07/2022 16:03, Christoph Hellwig wrote:
>> +	return max_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
> 
> Shouldn't this be a min?

eugh! yes. Stand by for v3
