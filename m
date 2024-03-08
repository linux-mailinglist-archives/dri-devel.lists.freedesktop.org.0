Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFC4875EC7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 08:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA1411244C;
	Fri,  8 Mar 2024 07:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="DiUCIVLE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4365D113162
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=To:References:Message-Id:Content-Transfer-Encoding:Cc:Date:
 In-Reply-To:From:Subject:Mime-Version:Content-Type:Sender:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=g/NAorO8l/Te8OdQCft8dz8oPzaAMPn6GugJdtMnuew=; 
 b=DiUCIVLE3Debe6sDy8HW6t2MgGibPQ5Dnl9dNtKXa/ZWRRie1neRQrfgw1Ua7B4Hay8ZpwOiKWV
 LTJSJeYyiOclVd8tV+bzvQidenUn6qsJwFKwk122tmJiruoiLQBFnhrYZeTiR6LMfotI/mALkur6W
 JKvpK2Mvg5VccJpJHH65XMMsOiH7u/ZnlGZrle82Jw/Yf0oAdb/stpdQbZpd0hi4fXrYq7tvTINNR
 FEQyqLH7MUg1gPF/Sa5DrjI3aajxwGoToW/kx3DNPzPDEZpBq/8XF/FWy6YJt/WH9KNKJXdYkWEfM
 P6WAeTdKwG8koykKl2CLu7u+yJiJiKqZ+Lcg==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1riUtb-000AXd-0m; Fri, 08 Mar 2024 08:43:59 +0100
Received: from [2a06:4004:10df:0:a93a:6c75:8ef3:361d] (helo=smtpclient.apple)
 by sslproxy06.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
 (envelope-from <sean@geanix.com>)
 id 1riUta-000S0h-Gf; Fri, 08 Mar 2024 08:43:58 +0100
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: sn65dsi83: dsi burst mode
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <ffdd3140-1729-4b77-86db-ee2e5c1e6b04@kontron.de>
Date: Fri, 8 Mar 2024 08:43:47 +0100
Cc: marex@denx.de, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2FAB05D3-69E7-448C-B3E5-636F4C7323C1@geanix.com>
References: <E35054BA-FBE5-4CEE-905C-1F5D20140590@geanix.com>
 <ffdd3140-1729-4b77-86db-ee2e5c1e6b04@kontron.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
X-Mailer: Apple Mail (2.3774.400.31)
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27207/Thu Mar  7 10:27:12 2024)
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



> On 7 Mar 2024, at 15.28, Frieder Schrempf =
<frieder.schrempf@kontron.de> wrote:
>=20
> On 07.03.24 09:09, Sean Nyekjaer wrote:
>> Hi,
>>=20
>> We are using the stm32mp1 together with the sn65dsi83 bridge.
>> The ti,sn65dsi83 driver is (hard) enabling MIPI_DSI_MODE_VIDEO_BURST, =
then the st,stm32-dsi driver is adding +20% to the clock speed.
>>=20
>> That means our LVDS is +20% higher than expected.
>>=20
>> Any proposals for a fix? Could we add a devicetree option to opt out =
of the burst mode?
>=20
> FYI, this issue has been raised before: =
https://lkml.org/lkml/2022/10/4/455.

Thx :)

Guess, we live with an out of tree patch that disables the =
MIPI_DSI_MODE_VIDEO_BURST.

/Sean=
