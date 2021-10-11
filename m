Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 204724294AD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 18:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0645C89C8D;
	Mon, 11 Oct 2021 16:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D3789C8D
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Oct 2021 16:40:09 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 78E6480691;
 Mon, 11 Oct 2021 18:40:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1633970407;
 bh=ht/C/Adi6uCh5e2svjeDkhNs81hDVQ5OopDrJUfJ1k0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hjINyKSnl0y0FqTG8/ZuCIBEaUS93Rpns4HvxZEmeO2wD9m2QTFMNVd/0jI59v3nQ
 oIbyQlQM5VGU5+R/3N9tQyOzYNpm7RVNUWePK2VYjeRkdTlx4sgkk8aXHStgtStPc/
 QcvHKk4D3e/yOuRjQacTX+T8eM0nBjC4Z6/LTqKzQg9vweZhdm2vMzhxDBj8AUgH2i
 GnVOJZ6JDDvUMRVHTY9djC64NFbpZIiyJtWsxYrwSDTpRZs8n4GIfePcolD98e+MUT
 Pb5HOSWZ7fSHSbqisnez9JrtrCxNGIuT0Ss6tQvSVujFav3PEXBk/YH1h2x69zvZPR
 xbOshOW35SiLw==
Subject: Re: [PATCH v2] drm: of: Add drm_of_lvds_get_data_mapping
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20211011112133.5313-1-marex@denx.de>
 <YWRl0/C/24SOjJpe@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <a148d272-0933-cb5f-c9f3-e2c917c89775@denx.de>
Date: Mon, 11 Oct 2021 18:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YWRl0/C/24SOjJpe@ravnborg.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

On 10/11/21 6:26 PM, Sam Ravnborg wrote:
> Hi Marek,
> On Mon, Oct 11, 2021 at 01:21:33PM +0200, Marek Vasut wrote:
>> Add helper function to convert DT "data-mapping" property string value
>> into media bus format value, and deduplicate the code in panel-lvds.c
>> and lvds-codec.c .
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> To: dri-devel@lists.freedesktop.org
> 
> Looks good. I will let the bots chew it a little before we apply.

Indeed. Some AB/RB would be good too.
