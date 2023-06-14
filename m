Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E66F72F430
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 07:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C3BE10E0DC;
	Wed, 14 Jun 2023 05:36:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 409 seconds by postgrey-1.36 at gabe;
 Wed, 14 Jun 2023 05:36:48 UTC
Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120DF10E0DC;
 Wed, 14 Jun 2023 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
 s=default; t=1686720598;
 bh=YMi7ui8mUgZ7xFFkJ5jRHmFFR0KM3n2BdmtqWjBfWoo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Xm3mi4uk+1eGjNtyboS8Ys6bgrLGRlC4yCrd64p73sBzfviEPL79mlXvS+ty1EIZx
 c3NIg3m+762aqr0b0naNw31oAYo+3RNevZfM7fhbw3i9tP92eHySeW105s5t5tmU9O
 fbBaZ439bPjEjOP+ya4F1+TuuDvWqaZXNyh7pJWSTzCzSGUmMRwGgkaBxckMEvGUU4
 V7zKLi8g3qFoV5Gki7QVAmzu8NbH3Ma3NqgWTr5tBs6Qm78U6IF6Y9Y9jstSJuPRXX
 GgOGDN4PqTDANYMBY46TF6pb7Zg/jK2nPK82ZgQXAnKFgyZSQ+pBjaDi9O7HiBPmx1
 QxvYxdXEOphcw==
Received: from [10.20.0.2] (unknown [182.253.126.223])
 by gnuweeb.org (Postfix) with ESMTPSA id ACF79249C00;
 Wed, 14 Jun 2023 12:29:52 +0700 (WIB)
Message-ID: <5844e20e-843d-f65e-107a-8fd4cff48e32@gnuweeb.org>
Date: Wed, 14 Jun 2023 12:29:48 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] amd/display/dc:remove repeating expression
To: Wang Ming <machel@vivo.com>
References: <20230614034936.876-1-machel@vivo.com>
Content-Language: en-US
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
In-Reply-To: <20230614034936.876-1-machel@vivo.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, opensource.kernel@vivo.com,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/14/23 10:49 AM, Wang Ming wrote:
> Identify issues that arise by using the tests/doubletest.cocci
> semantic patch.Need to remove duplicate expression in if statement.
> 
> Signed-off-by: Wang Ming <machel@vivo.com>

Reviewed-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>

-- 
Ammar Faizi
