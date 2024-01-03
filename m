Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2515C822D55
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 13:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1485110E280;
	Wed,  3 Jan 2024 12:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel-space.org (mail.kernel-space.org [195.201.34.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E55610E14B;
 Wed,  3 Jan 2024 12:41:08 +0000 (UTC)
Received: from kernel-space.org (localhost [127.0.0.1])
 by kernel-space.org (OpenSMTPD) with ESMTP id a984163b;
 Wed, 3 Jan 2024 12:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=kernel-space.org; h=
 message-id:date:mime-version:from:subject:to:content-type
 :content-transfer-encoding; s=s1; bh=jJ51hW6QK8xSwgliZjmDtf2wAhE
 =; b=j7GdNGdb0yZRv0ti9mO3OcGNEd0UGCmfnTGYK+pBgGGzGAIN1ukm0D0lThS
 3BOj0gA+vpCDWoKWj/2iciFZVgM1/AUHk4+/ohv+y35yB+w3iLa0i8HGaBzp/W2C
 AlW9XzRtt3sA3+ATnHx97MFvF5yeGCfgv8CqfUhzbNGgGQnw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=kernel-space.org; h=
 message-id:date:mime-version:from:subject:to:content-type
 :content-transfer-encoding; q=dns; s=s1; b=XT1LM56d0f794Gmg1Bo7s
 MXLspb+gTwqQlW17hNz9T4l2QIXngxPzArpxvCI+7GFvbpDFbZNJp7r583CqU6E0
 2ipQgk7j2hycTv4VGmgJk8uOz+/qkZZmH6bMisoL0qqLVg5mb5yDR7JOgY3sHnFF
 GaCEySI6UrIvLeQ98jpadU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel-space.org;
 s=s1; t=1704285603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jso+kg0PCrUfKK3VrwCFHag8Ddx6YoUU5qjOQHaiT0g=;
 b=llPk5QihMzHFtDheSmk1FFMzHTVG9jdK30tPRweYYe4Tomyvl5EYNsITDC5cqzTDrCNpKX
 AsxxB430E23Zwrfm6K0L2ohx2FmrrNiLZqv0y7baOIWCQVnWLX0lWyQgqpZ7eJlEn47paH
 sLtZf6kdPaRUjmG9rtbNG2XTdaH3Hy4=
Received: from [192.168.0.2] (host-79-41-232-3.retail.telecomitalia.it
 [79.41.232.3])
 by kernel-space.org (OpenSMTPD) with ESMTPSA id 0228b807
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 3 Jan 2024 12:40:03 +0000 (UTC)
Message-ID: <52131e33-fc34-1a6f-17b8-4e3f30757192@kernel-space.org>
Date: Wed, 3 Jan 2024 13:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Betterbird/102.11.0
From: Angelo Dureghello <angelo@kernel-space.org>
Subject: AD107M (197), black screen
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dakr@redhat.com, bskeggs@redhat.com
Content-Language: en-US, it
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

Hi all,

i am testing current mainline (6.7.rc8), on
a lenovo legion, with AD107M (chipset 197000a1).

Looks like somewhere at driver probe, screen turns
black and stays forever. If any hint, welcome.

I can help debugging, rebuilding and testing in case.

Regards,
Angelo Dureghello
