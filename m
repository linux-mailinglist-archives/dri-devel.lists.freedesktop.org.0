Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FAC6A0FE0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 19:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B48910E049;
	Thu, 23 Feb 2023 18:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [IPv6:2a01:4f8:231:de0::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862A910E04C;
 Thu, 23 Feb 2023 18:56:16 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id 59512C8008D;
 Thu, 23 Feb 2023 19:56:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 6jDo7QXKqRe7; Thu, 23 Feb 2023 19:56:14 +0100 (CET)
Received: from [192.168.176.165] (host-88-217-226-44.customer.m-online.net
 [88.217.226.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 02CBAC8008A;
 Thu, 23 Feb 2023 19:56:12 +0100 (CET)
Message-ID: <52f48cb2-ce54-854f-3bec-44c40c6ad07f@tuxedocomputers.com>
Date: Thu, 23 Feb 2023 19:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/2] Add quirk to disable PSR 2 on Tongfang PHxTxX1 and
 PHxTQx1
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>,
 "Santa Cruz, Diego" <Diego.SantaCruz@spinetix.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Kahola, Mika" <mika.kahola@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>,
 "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20230222141755.1060162-1-wse@tuxedocomputers.com>
 <9b0e29f15f3e8799256c425f06b36a70ec04522f.camel@intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <9b0e29f15f3e8799256c425f06b36a70ec04522f.camel@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 23.02.23 um 19:26 schrieb Hogander, Jouni:
> On Wed, 2023-02-22 at 15:17 +0100, Werner Sembach wrote:
>> On these Barebones PSR 2 is recognized as supported but is very
>> buggy:
>> - Upper third of screen does sometimes not updated, resulting in
>> disappearing cursors or ghosts of already closed Windows saying
>> behind.
>> - Approximately 40 px from the bottom edge a 3 pixel wide strip of
>> randomly
>> colored pixels is flickering.
>>
>> PSR 1 is working fine however.
>>
>> This patchset introduces a new quirk to disable PSR 2 specifically on
>> known
>> buggy devices and applies it to the Tongfang PHxTxX1 and PHxTQx1
>> barebones.
> I've been thinking something similar as there is still at least one
> issue which seems to be like panel side issue:
>
> https://gitlab.freedesktop.org/drm/intel/-/issues/7836
>
> Did you considered dpcd_quirk_list in drivers/gpu/drm/drm_dp_helper.c?
>
> I'm not sure which one is more correct though...
Imho, since the proper fix lies within the Intel driver the quirk should also 
lie within the Intel driver, because even if the panel has the same problem 
combined with an AMD or NVIDIA card the proper fix for them will most likely be 
land in the same kernel version. So there could be a period where you no longer 
want the quirk for devices combining the panel with an Intel gpu but still with 
an AMD GPU or vice versa.
>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Cc: <stable@vger.kernel.org>
>>
>>
