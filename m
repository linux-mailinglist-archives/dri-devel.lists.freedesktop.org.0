Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DB65EE12
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 15:01:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76B210E743;
	Thu,  5 Jan 2023 14:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3006::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D01F10E735
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202212;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LSoYlL2xeMevW29+r2ORCaw6mzKCLCNq0ySTpq09EyY=; b=V/WS6dcoWhLAXTY3/gZThz6Oot
 M32pM+xwzBaQXzzrOpPHe2U1MOOvNxeBlVTFKNu1U6l+M2X3lLRjFxGc35TKY2lfCXfDYplI0nsU+
 vcuAHehLDtqEqA3oIg5Ddlq7sIcat6d9WDMapmfYi66ziUO0a/FjBNBlyS4w0zn0gmXeMBjb7hsLi
 Dwpen1ZizToFJuAUfwsD3JV7IzIAPLmnEHn06NUGfkuFQLTq1hv5Kdkv1zpsgfLgVN4f7WBTqft+F
 cnZGe9zkp/MTT9UnZJS5DFOddZt4Ys5njgrP326uzIUAXqngi6Yz7VEVCsjGYKMj2dmL6hqjUsueV
 86YfIHXg==;
Received: from [2a01:799:95e:b600:b244:dd1d:d193:f437] (port=41916)
 by smtp.domeneshop.no with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <noralf@tronnes.org>) id 1pDQnt-000KS9-Ed;
 Thu, 05 Jan 2023 15:01:10 +0100
Message-ID: <31a82b60-3249-814f-b26e-0415feff9fa9@tronnes.org>
Date: Thu, 5 Jan 2023 15:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Driver for CFAF240320X0-020T display
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
References: <CAOMZO5Ba5eNCQO9GQezbEO5RX=C7EpUSz1zjO78Ki0kD3aK2uw@mail.gmail.com>
 <a4945d6e-be05-bac1-38d2-a3154a15aa8c@tronnes.org>
 <CAOMZO5C+u7knB-5K-CPFWL8wQ5H3fB02742dZ4P=1FmrJhvEPg@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <CAOMZO5C+u7knB-5K-CPFWL8wQ5H3fB02742dZ4P=1FmrJhvEPg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: damien.lemoal@wdc.com, Oliver Graute <oliver.graute@kococonnector.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/5/23 13:57, Fabio Estevam wrote:
> Hi Noralf,
> 
> On Fri, Dec 16, 2022 at 9:30 AM Noralf Trønnes <noralf@tronnes.org> wrote:
> 
>> There is a DRM driver that can be used with all of these controllers:
>> drivers/gpu/drm/tiny/panel-mipi-dbi.c. It uses a firmware file for the
>> init commands.
>>
>> Binding:
>> Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
>> Wiki: https://github.com/notro/panel-mipi-dbi/wiki
> 
> Thanks for your suggestion.
> 
> I was able to get the CFAF240320X0-020T display to work with the
> panel-mipi-dbi.c
> driver.
> 
> You did a great job on this driver and wiki!
> 

Thanks, glad you could make it work.

Noralf.
