Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A46A6D3F94
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 10:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F3D10E3B8;
	Mon,  3 Apr 2023 08:56:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F42F10E3B8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 08:56:57 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69D066CF;
 Mon,  3 Apr 2023 10:56:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1680512214;
 bh=1ZHeZaWdZIbWV2RqdUd88fc3sgABolRI/jxONF0HjVw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k1k1YlLom20lkfJEYMhpQjBK5wTUR5A9tTW9o+oBe1lZbUGDCA3yZ/Ic6+AH5lYv3
 9bU5WxUdjKLFv4+ZlHrSq/rX8Ma+iW1SfF1hMbCpYN9tk9v/4S3vL9HksmYN3dRjhh
 3rEs353GIKByzzn3AcEjaoMpbWEUkKNOL89/P5Ug=
Message-ID: <a53bb157-0dde-62cc-53c3-cd99ae8ad1cd@ideasonboard.com>
Date: Mon, 3 Apr 2023 11:56:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 6/6] drm/omapdrm: Implement fbdev emulation as in-kernel
 client
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-7-tzimmermann@suse.de>
 <f93625f4-e915-69c4-fca4-59ab6c666bc2@ideasonboard.com>
 <aff26bc9-d0fc-7f17-f334-bdc00416cdca@suse.de>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <aff26bc9-d0fc-7f17-f334-bdc00416cdca@suse.de>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On 03/04/2023 11:24, Thomas Zimmermann wrote:

>> That's my only real comment. Kernel test bot had one comment too. But 
>> other than that:
>>
>> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>
>> I tested this series on TI DRA76 EVM, and worked fine for me.
> 
> That you so much.
> 
> I'm going to send out an update with the fixed patches. Is there an omap 
> tree or does it later go through drm-misc?

drm-misc. I can push the v2 after testing it.

  Tomi

