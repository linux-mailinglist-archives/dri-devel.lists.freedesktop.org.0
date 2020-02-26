Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1FC170216
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 16:16:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59366E9AC;
	Wed, 26 Feb 2020 15:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF786E9AC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 15:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582730155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vlqJvdOJUT/fcJ/c+/eBjXQbTAJrNXWIRm6p2rPgmi0=;
 b=Q0NQCH4oxv/INF7Zln9febrAKbOv4yRuKioSwFUGPWQ8ziGf1N8dSFWdiRoAvqj7lR/wMV
 8wi7i2PNgRA9iQinHr39huCNAtOeR2J0Odkr8axYti1iK2owRGLLPehNWGx9iMPIt2i5ag
 xQqP3jxG3n4dsQjVX0OsTYptQMR0Sjg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-rQlf-d_dMlmeOB-CZx6_dQ-1; Wed, 26 Feb 2020 10:15:45 -0500
X-MC-Unique: rQlf-d_dMlmeOB-CZx6_dQ-1
Received: by mail-wm1-f71.google.com with SMTP id z7so1050992wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 07:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=vlqJvdOJUT/fcJ/c+/eBjXQbTAJrNXWIRm6p2rPgmi0=;
 b=tzRvxGRVQslp4FoJx+zsesR9sTAJgjk8oJvKKhwbESZOTDhSUY4zQvK5W2J+LVl1Dv
 SiY/bkDXSNk+eMmGHCmo4yptW8OrtA+lZjxY8/GJ1eKSxYBich2qM7ABT5PnZCdyg351
 dKvlGw3XH/cleKXjN0lty4/li9M1zuOzbBFImG4YS2a7H06cz5kraKEgxHUZw9zON/De
 lNOZDdE+CGkPv6h4yJZ8P6jnIF/GgQa1Gen6udfJRzEJza2TCr/rb9PGCAmbsjyqFyYI
 LhH/ILYayz0aG/nMtEdYF5os5eq37kwJHrMS/fmIc2D+vtpvJSHksUehHiZhOR075SK5
 GwNw==
X-Gm-Message-State: APjAAAXPmJnEDJbNw1Uulzp56EVjwTJDiCWMvo5MP3L0he48a8vWW5mL
 uHQ2AIMXATgTzZz2FneLQTyhIrmJM/HRsRYg8qOFkQoHugVYnUntYdVOh5vkccOrzE1Bj0kR+yL
 O1Hy0Uy39d8gpkk7jAMNbf2URcwyB
X-Received: by 2002:a1c:9854:: with SMTP id a81mr5884463wme.1.1582730144160;
 Wed, 26 Feb 2020 07:15:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqwag0vTFX22t7gPPA5l7esl1Nj/Rk2Mq5RJdLikdQu43lnhFzehhKnaVD4Gt5NN9LZrlqU0mw==
X-Received: by 2002:a1c:9854:: with SMTP id a81mr5884441wme.1.1582730143825;
 Wed, 26 Feb 2020 07:15:43 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
 by smtp.gmail.com with ESMTPSA id r28sm3721723wra.16.2020.02.26.07.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 07:15:43 -0800 (PST)
From: Hans de Goede <hdegoede@redhat.com>
Subject: 5.6 DP-MST regression: 1 of 2 monitors on TB3 (DP-MST) dock no longer
 light up
To: Lyude Paul <lyude@redhat.com>
Message-ID: <99213368-5025-8435-502b-3d23b875ca60@redhat.com>
Date: Wed, 26 Feb 2020 16:15:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lyude and everyone else,

Lyude I'm mailing you about this because you have done a lot of
work on DP MST, but if this rings a bell to anyone else feel
free to weigh in on this.

I'm currently using a Lenovo X1 7th gen + a Lenovo TB3 gen 2 dock
as my daily rider for testing purposes. When 5.6-rc1 came out I
noticed that only 1 of the 2 1920x1080@60 monitors on the dock
lights up.

There are no kernel errors in the logs, but mutter/gnome-shell says:

gnome-shell[1316]: Failed to post KMS update: Page flip of 93 failed

With 93 being the crtc-id of the crtc used for the monitor which is
displaying black. Since then I've waited for 5.6-rc3 hoping that a
fix was already queued up, but 5.6-rc3 still has this problem.

gnome-shell does behave as if all monitors are connected, so the
monitor is seen, but we are failing to actually send any frames
to it.

I've put a log collected with drm.debug=0x104 here:
https://fedorapeople.org/~jwrdegoede/drm-debug.log

This message stands out as pointing to the likely cause of this problem:

[    3.309061] [drm:intel_dump_pipe_config [i915]] MST master transcoder: <invalid>

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
