Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FA4B8B9C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 15:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4EF210E160;
	Wed, 16 Feb 2022 14:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5155F10E413
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 14:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645022383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cl+8YFMjb2VBJ6rl0MY5d7pD2vbA+DlvHNAVibik0kU=;
 b=exvszWt+0tkOsa1oliMqJDwtEODnpppwBraCCL4YLSdt14Wkh2kxB6tNox30bYuViBkH6t
 YPumQ9RqZpzpvqlRYg1nLlBYowuzTRRM6mpsMrsamrTWzcG97jN+R7hCZGcUnTq/M2ivNP
 +31gDfAGBHVVnvnWwdnCsl2SBImj+HE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-wzLSkr-QNACLX11km0ZmEg-1; Wed, 16 Feb 2022 09:39:37 -0500
X-MC-Unique: wzLSkr-QNACLX11km0ZmEg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h82-20020a1c2155000000b003552c13626cso2982968wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 06:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:from:subject:to:cc:content-transfer-encoding;
 bh=cl+8YFMjb2VBJ6rl0MY5d7pD2vbA+DlvHNAVibik0kU=;
 b=6iBi8xTLATCPyPxJq7f9h0sUNjkmLLq2NUIjCjxdbGb6DTTUQfGdK9hvLhppYjwIoR
 nPYoDMLBOfaUZcUnOuZpL2+Z6ghr8x6ienk2MNeePIXuR3XgM+uztSyvfZBFF/h4Mekf
 WVesoNPWu1zZNTVhEGBdYcnIkXRzMj8Ja2VTj+9tso3XslN5mMCpwgXF/vYUoH9pR96o
 RWumpHdeqN17lFDmXsqu+gaV0JtLXKTlB5e+jQyJVk6PvxYuoEoxgwIedFG7+xKV6CHQ
 MxB0DUl7ktUZq0USuOCkSN2MN8izvy3jJqvanYyPjOJOR8ufy8x6uMXsB1r0rKbhWmyB
 dbcA==
X-Gm-Message-State: AOAM530rA/9NNOEIWyJ4qt0ttvaI6nicUQ6fqvZ7IP5cuFgk27mp1Bz/
 gkdP80lYPDao1bWNs3rsqa8MZkHwjdLFUVCrn8L6NjS2cX3TIFoaWKOFCpMNAHCXO5a80LyoLsl
 rQVoQmHZPzajh883qO1rSjchk2itGFClJm5PC/1dekwgoJOvSBOOPifPm00Et/ixbbcgxUL39ke
 xo2APM
X-Received: by 2002:a5d:5483:0:b0:1e4:a492:90a6 with SMTP id
 h3-20020a5d5483000000b001e4a49290a6mr2592063wrv.280.1645022376083; 
 Wed, 16 Feb 2022 06:39:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0ZmWlTiSkxdrYXcUmAGZEnaM5FNs7l1Iy9hYCgEL4Xw7h/n8UUOx10vfRg35B6Rhgou03JQ==
X-Received: by 2002:a5d:5483:0:b0:1e4:a492:90a6 with SMTP id
 h3-20020a5d5483000000b001e4a49290a6mr2592047wrv.280.1645022375884; 
 Wed, 16 Feb 2022 06:39:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id g20sm21022684wmq.17.2022.02.16.06.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 06:39:35 -0800 (PST)
Message-ID: <47101f87-48d7-0c93-adbf-9b84cd3754a3@redhat.com>
Date: Wed, 16 Feb 2022 15:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr 0x4b0
 for 1 bytes NAKed
To: dri-devel@lists.freedesktop.org
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Richard Hughes <rhughes@redhat.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <mdaenzer@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

When using a Lenovo dock, I often get this error message on dmesg:

[drm] *ERROR* mstb 0000000057b5b857 port 1: DPCD read on addr 0x4b0 for 
1 bytes NAKed

It's caused by fwupd which tries to read from /dev/drm_dp_aux4

I opened an issue on fwupd:
https://github.com/fwupd/fwupd/issues/4284

But it turns out, it's probably an issue in the drm mst code instead.

When I connect my Dock (Lenovo Thinkpad Thunderbold 3 Gen 2), I get 3 
drm_dp_aux[] created:

/dev/drm_dp_aux[456]

Reading from this devices at any address will always get the NAKed error 
above, unless there is an actual DP monitor connected (HDMI monitor or 
nothing connected gives a NAK)

Each time I connect or disconnect a monitor on the dock, this 3 
/dev/drm_dp_aux[] are destroyed and recreated.

So I think the device /dev/drm_dp_aux[] should be created only if there 
is an actual monitor connected that can reply to it.
What's the purpose of providing userspace a device which can't be read 
or written ? (or maybe just fail the open() call, like Mario suggested 
on the fwupd issue, so the devices are still there with the same numbering)

On the other hand, we can also consider that it's expected to get NAck 
in drm_dp_send_dpcd_read() and replace drm_err() with drm_dbg()

what do you think ?

-- 

Jocelyn

