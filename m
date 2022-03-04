Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1A4CCAC8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 01:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B198A10E3F4;
	Fri,  4 Mar 2022 00:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC71710E3F4
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 00:26:53 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 083E483874;
 Fri,  4 Mar 2022 01:26:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646353612;
 bh=9QiqCGt6OKYFG8bQS6yqc+uSZcGqN+3QWocxzUWD/ZU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QskztFg+Udofb+ZIRpz1IKr6FCcGx2XFOWQztxZ/uWdjJgKC+5RNgfJk0goYNcujU
 nSxleiQN8rWOttgGq+8daX+6ZlJgCfnUMuxxu0zBKqQUIueTtzmO8LbGg5zL5vew7B
 C07L/NK5bvUkE+fDtzGpLwBft2L221xO9Nz3pubACRdGSHcqGsbQYqExLUhvaM7cDv
 mT6HijoM2TJ5iKXrdezVFbIJ4uVlk83c/QmJkPZwGhdYt6ItRH8sTnvAhefH5fbtcT
 66RZnZm995AYECA79SG9MA+/2vdJd/O1gNNJ3ss5/H2VwEwqTN0b1TWGEsBj0Jnc2V
 CTeCzPR3DFeKw==
Message-ID: <8087eaf8-0fa9-a6fe-0383-56de09cbdbfc@denx.de>
Date: Fri, 4 Mar 2022 01:26:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH V2 04/12] drm: bridge: icn6211: Add DSI lane count DT
 property parsing
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220217002530.396563-1-marex@denx.de>
 <20220217002530.396563-5-marex@denx.de>
 <20220302100143.pvy77sw2sgd57tql@houat>
 <3d5f1c7d-3ee7-027b-47e8-6b5923657358@denx.de>
 <20220303125421.a5v63n27oskopxzc@houat>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20220303125421.a5v63n27oskopxzc@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Robert Foss <robert.foss@linaro.org>, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 13:54, Maxime Ripard wrote:

[...]

>> Regarding the default value -- there are no in-tree users of this driver yet
>> (per git grep in current linux-next), do we really care about backward
>> compatibility in this case?
> 
> If it hasn't been in a stable release yet, no. If it did, yes

It was in a stable release, V3 is out.
