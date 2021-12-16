Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE09476EC1
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 11:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6B610E748;
	Thu, 16 Dec 2021 10:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2070B10E748
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 10:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LE0DX3vM/6i012RsYGvAzW8/1QfnhvpLlriFhVqFXlE=; b=iVlgz/6K/cmAZ7Ea9FX+bG82Xo
 J/rCvSU9w7gTCG6FUxevxEn+o8nFkoTKr4OdiSJONCKcevrjEzHpNu8g7jjO88P6O6dSsyJWVAQue
 PW8kD7sLaJh0eH/+193RuZFKieJ78zzjkEx/AhVRP8jfgKOalnGFsOvtTYMcitXqxjUUxvboPsF5D
 +jR9tlQofQKgNSSr3jm3xM9s2Vl7tRgt+y9VBT6d9iNEHQNdmyxMh5kMF5jEyveqNpbik61gSyoli
 15xJqDOoNCNRvOvfiaghKw6wQiRfd2Pd2B5qPkhs3G+bue4jTa+EIylvGlVojBQnoPRdXMA4xgEeS
 cR+FhvvA==;
Received: from webng-gw.kapsi.fi ([91.232.154.200] helo=roundcube.kapsi.fi)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <jyri.sarha@iki.fi>)
 id 1mxnsd-0006QM-2y; Thu, 16 Dec 2021 12:20:55 +0200
MIME-Version: 1.0
Date: Thu, 16 Dec 2021 12:20:52 +0200
From: Jyri Sarha <jyri.sarha@iki.fi>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2] drm/tilcdc: add const to of_device_id
In-Reply-To: <c0adb7fef6d51691e864fdaef5595a9014b12f1e.camel@perches.com>
References: <20211216092652.33414-1-wangxiang@cdjrlc.com>
 <c0adb7fef6d51691e864fdaef5595a9014b12f1e.camel@perches.com>
Message-ID: <ae333b46910989862ca2bd17f409833b@iki.fi>
X-Sender: jyri.sarha@iki.fi
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.232.154.200
X-SA-Exim-Mail-From: jyri.sarha@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: Xiang wangx <wangxiang@cdjrlc.com>, tomba@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-16 11:44, Joe Perches wrote:
> On Thu, 2021-12-16 at 17:26 +0800, Xiang wangx wrote:
>> struct of_device_id should normally be const.
> []
>> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c 
>> b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> []
>> @@ -60,7 +60,7 @@ void tilcdc_module_cleanup(struct tilcdc_module 
>> *mod)
>>  	list_del(&mod->list);
>>  }
>> 
>> -static struct of_device_id tilcdc_of_match[];
>> +static const struct of_device_id tilcdc_of_match[];
> 
> This line could likely be removed instead.
> 
> $ git grep -w -n tilcdc_of_match
> drivers/gpu/drm/tilcdc/tilcdc_drv.c:63:static struct of_device_id
> tilcdc_of_match[];
> drivers/gpu/drm/tilcdc/tilcdc_drv.c:590:static struct of_device_id
> tilcdc_of_match[] = {
> drivers/gpu/drm/tilcdc/tilcdc_drv.c:595:MODULE_DEVICE_TABLE(of,
> tilcdc_of_match);
> drivers/gpu/drm/tilcdc/tilcdc_drv.c:603:
> .of_match_table = tilcdc_of_match,
> 

Oh yes. It appears to have been there from day one and even then it was 
bogus.

Xiang Wang, could you produce one more version of the patch with the 
declaration removed.

Best regards,
Jyri

>> @@ -587,7 +587,7 @@ static int tilcdc_pdev_remove(struct 
>> platform_device *pdev)
>>  	return 0;
>>  }
>> 
>> -static struct of_device_id tilcdc_of_match[] = {
>> +static const struct of_device_id tilcdc_of_match[] = {
>>  		{ .compatible = "ti,am33xx-tilcdc", },
>>  		{ .compatible = "ti,da850-tilcdc", },
>>  		{ },
