Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE2C3C147C
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 15:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E4A6E8C4;
	Thu,  8 Jul 2021 13:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E916E8C4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 13:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFFlmrhwS4AmvDuo3Ua+/NppnA3i1OamA5dY1c8wRfQ=; b=czptK3pAnUz4K/OUQZTizs4rKl
 EUVK/14rfEq6u2R/s0nKwKkU3JOlVk3nH3gTPJjphjDnKAlgGtRnP62Qoa4tfk5BC8azMGJL+Kp3I
 QNqfKIZOVW0FO0VmFnaPGa6Sflx6CuYhp9OlxhPETCG+9cVxjdrJs9INGsa8qQ4vTqDtGIC/Gl5bb
 0GJDHCdWz98HwTmI/pzwWxl6ri47EqITXZ64IB853J4ZUFk4bT9gZWnROpRbCWV7pMXJwXPBm6lNz
 5O3SuQMh9Lw+KcGz0vneIcSwxIvdEYVWZCJgmV8t3ZDNQrpuWBK0sCtsBRJvvoA6tvfpIXpLWm6wm
 x9EmhO9g==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52306
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1m1UHV-000656-Rz; Thu, 08 Jul 2021 15:41:33 +0200
Subject: Re: [PATCH 1/2] drm/gud: Add Raspberry Pi Pico ID
To: Peter Stuge <peter@stuge.se>
References: <20210703141321.35494-1-noralf@tronnes.org>
 <20210703192448.26298.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <feaa0011-a6ee-527b-b2ae-93068bf972f6@tronnes.org>
Date: Thu, 8 Jul 2021 15:41:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210703192448.26298.qmail@stuge.se>
Content-Type: text/plain; charset=utf-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 03.07.2021 21.24, skrev Peter Stuge:
> Hi Noralf,
> 
> Noralf Trønnes wrote:
>> Add VID/PID for the Raspberry Pi Pico implementation.
>> Source: https://github.com/notro/gud-pico
>>
>> +++ b/drivers/gpu/drm/gud/gud_drv.c
>> @@ -660,6 +660,7 @@ static int gud_resume(struct usb_interface *intf)
>>  
>>  static const struct usb_device_id gud_id_table[] = {
>>  	{ USB_DEVICE_INTERFACE_CLASS(0x1d50, 0x614d, USB_CLASS_VENDOR_SPEC) },
>> +	{ USB_DEVICE_INTERFACE_CLASS(0x16d0, 0x10a9, USB_CLASS_VENDOR_SPEC) },
>>  	{ }
>>  };
> 
> A VID/PID isn't neccessarily tied to one implementation; as long as an
> implementation is in fact compatible with the driver I consider it okay
> to reuse a VID/PID, and the 0x1d50 conditions are met by gud-pico too.
> That said, there's no harm in adding another id. :)
> 
> Reviewed-by: Peter Stuge <peter@stuge.se>
> 

Both patches applied, thanks for reviewing.

Noralf.
