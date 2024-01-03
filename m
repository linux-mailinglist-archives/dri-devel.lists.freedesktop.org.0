Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A1F822E79
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 14:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F45310E2A4;
	Wed,  3 Jan 2024 13:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 399 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jan 2024 12:37:40 UTC
Received: from mail.kernel-space.org (mail.kernel-space.org [195.201.34.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022C510E280;
 Wed,  3 Jan 2024 12:37:40 +0000 (UTC)
Received: from kernel-space.org (localhost [127.0.0.1])
 by kernel-space.org (OpenSMTPD) with ESMTP id 5225f19b;
 Wed, 3 Jan 2024 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=
 message-id:date:mime-version:from:to:subject:content-type
 :content-transfer-encoding; s=s1; bh=jJ51hW6QK8xSwgliZjmDtf2wAhE
 =; b=euk35juEWF/iGRUkt0AjfmTmCgQWJnaF7pXerXVMmzq1EonAZXOt1TEQ4Vz
 w0hDJWW4LH5BJ3y+/lgmhAKg69TgF4SJ1WB7BXM4u4DM13nc+MJLBTS5oaOOBCyP
 RQ+99hPoVjWw5zXtAO9ogVPovv3bpzbaExT3AsDo93WSap4o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=
 message-id:date:mime-version:from:to:subject:content-type
 :content-transfer-encoding; q=dns; s=s1; b=ClvWMrhhxoW9NbhZSVzIi
 U0J+/C6oO8TJmCjBrR0/NtKpgm/6/WTQZ7WZYTZqyPr5hXtS8zFozKT87T+SCpM3
 dNvrJqISMkmLpczUmQC20AQkR6WmzBAirEcXJ3xESLdcUrzGTjkL0PV5ImpQfT0l
 UwnO1BVeFxq5PHm/rihhX4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1704284994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jso+kg0PCrUfKK3VrwCFHag8Ddx6YoUU5qjOQHaiT0g=;
 b=zjFq6HYUOZUhQR46j0UkdkWAltPLbvU7dN1ANsDZmmEi87BGGlbEHelvWXt8/f71V/UPJi
 MgfJgSDNYKKkUS9xNkj7Sgnm2p/G8Pi82cqrhEMVjswllCFIRpQT1K4LkjfVRDAuWrNYzj
 tWDAiUKUbA5oI0aUB2zbllh+YagnvuY=
Received: from [192.168.0.2] (host-79-41-232-3.retail.telecomitalia.it
 [79.41.232.3])
 by kernel-space.org (OpenSMTPD) with ESMTPSA id 20df6116
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Jan 2024 12:29:54 +0000 (UTC)
Message-ID: <3419b50b-2ac7-c7b7-1289-d8eb5cc467f8@kernel-space.org>
Date: Wed, 3 Jan 2024 13:30:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Betterbird/102.11.0
Content-Language: en-US, it
From: Angelo Dureghello <angelo@kernel-space.org>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dakr@redhat.com, bskeggs@redhat.com
Subject: AD107M (197), black screen
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 03 Jan 2024 13:35:26 +0000
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

Hi all,

i am testing current mainline (6.7.rc8), on
a lenovo legion, with AD107M (chipset 197000a1).

Looks like somewhere at driver probe, screen turns
black and stays forever. If any hint, welcome.

I can help debugging, rebuilding and testing in case.

Regards,
Angelo Dureghello
