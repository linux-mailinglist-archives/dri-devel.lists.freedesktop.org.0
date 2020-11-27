Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75162C7C3C
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 02:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911596E3FE;
	Mon, 30 Nov 2020 01:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45E86EEA4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 20:30:44 +0000 (UTC)
Received: from [IPv6:2804:431:e7dc:db22::def] (unknown
 [IPv6:2804:431:e7dc:db22::def])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0574D1F465C9;
 Fri, 27 Nov 2020 20:30:40 +0000 (GMT)
Subject: Re: [BUG] drm/vkms: Failure when using drmGetConnectorCurrent()
To: Daniel Vetter <daniel@ffwll.ch>
References: <d589025b-76b2-1826-1798-60f61000b14a@collabora.com>
 <20201124143947.GP401619@phenom.ffwll.local>
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
Message-ID: <67fc48bd-1988-e69a-0b9b-e4d5cb4f390a@collabora.com>
Date: Fri, 27 Nov 2020 17:31:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124143947.GP401619@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 30 Nov 2020 01:02:59 +0000
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
Cc: Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/24/20 11:39 AM, Daniel Vetter wrote:
> On Fri, Nov 20, 2020 at 01:19:04PM -0300, Leandro Ribeiro wrote:
>> Hello,
>>
>> We have a patch in Weston to replace drmGetConnector() calls with
>> drmGetConnectorCurrent():
>>
>> https://gitlab.freedesktop.org/wayland/weston/-/issues/437
>> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/518
>>
>> Unfortunately this is not working when we use VKMS (upstream version
>> tested). Please see
>>
>> https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/518#note_700345
> 
> I guess this is without fbdev configured on vkms? That's what usually
> papers over this problem for most drivers.

Yes, without fbdev configured.

>> for more information, and feel free to jump into the discussion. If there's
>> more helpful information that I can share, please let me know.
> 
> Like Simon suggested, please submit that patch you have for discussion.
> -Daniel

Sure, I'll submit the patch.

Thank you,
Leandro Ribeiro.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
