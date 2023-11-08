Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF697E4DC2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 01:11:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1AE210E6D0;
	Wed,  8 Nov 2023 00:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D985F10E6D0
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 00:11:48 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2809414efa9so5025523a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 16:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699402308; x=1700007108; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o5FTMnIkfAnWQrINqJsE9vGOX5Y79juiKePAWCBp2xQ=;
 b=HAdJmfOaU13digVBwYgEN6xnedCaieg4XSUjDve3qBr4nFSslxzLTztv44logKEklL
 +3iJnnV7GViHutyx1dlsPTQ/qMUtxQv8giHsl7uZ+nkorNTDecaSCRDJyGk2CH/Q3Rf/
 C76Wd/iBlL8vZiVJLiL35xxNesS5FHSkDw0nKD9JI5mObiW5z/CdwZzIqETDa/BJpFNr
 cSv+K1fIi0tkGOpAgdFaabPzF/PWETi3Kofa7nDueV5N/yjdEPyPMUW/03OCFI/Rrnti
 snL+W3g0WEvVF/ViQ/y2CiedqYN4VMWcotfilNpCdkdOgTkBsZZgBBn+SL6wIuso0j8Z
 l7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699402308; x=1700007108;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o5FTMnIkfAnWQrINqJsE9vGOX5Y79juiKePAWCBp2xQ=;
 b=qQ2Pt4rCb1IViQGkjqhbKkDkcYFhRTmVpX0coFxc25Y8RQ+rVJZzVia7fNWMSrAG6+
 Y/id76kiSxa/hhm2MzBNk/M+IP9wLWFt8qW4q9RQJvE2s34XFDJ+YOHKO9EZa8XqOvdB
 DPEbHwb5LWwzrdVWun8vpg44G41Ikb/Sa/gf8PliZnNrwzPJrP2U/HcsBv0vb0MYpqM4
 S7KuMI2pObkYgjgZUvx5kQymPWSW4kCyF2fneMAMAsQm0lZ/MIgzZHyuAjQYW7oDw1yV
 ZCKE8aXQycdZz3tRsCh+QK3RvyrPrcYt6DCMbVVPDeXZq0X9H/b6FK3Ly7+8c7ZExqNk
 7mGA==
X-Gm-Message-State: AOJu0YxxiaLc+nJODGnSTlGNjIFtU4v/czJOjTYE3JTDRpKgI0N6eN8c
 Lm1YV8+ldJLlnv9njyy2n/A=
X-Google-Smtp-Source: AGHT+IFKm49M/VNzE67GA8NDQr1TupQFHjgD/NPr5R/pbLEg4jII8BqgTf96Oyl2ntsD/3uIsg4c6A==
X-Received: by 2002:a17:90b:4a88:b0:280:1a19:6dd5 with SMTP id
 lp8-20020a17090b4a8800b002801a196dd5mr219806pjb.36.1699402308282; 
 Tue, 07 Nov 2023 16:11:48 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
 by smtp.gmail.com with ESMTPSA id
 w7-20020a17090aad4700b00280fcbbe774sm352767pjv.10.2023.11.07.16.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 16:11:47 -0800 (PST)
Message-ID: <ad48a0bf-0454-44ee-ae00-eff3f8b66ca6@gmail.com>
Date: Wed, 8 Nov 2023 07:11:36 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: 01f05940a9a75e11a2be64993c44ad8dd06e6e26 causes Wayland servers
 to flicker in non-gl virtio QEMU cards
Content-Type: text/plain; charset=UTF-8
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
Cc: bluescreen_avenger@verizon.net,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@redhat.com>, Christian Hergert <chergert@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> It seems that commit 01f05940a9a75e11a2be64993c44ad8dd06e6e26 introduced an issue impacting wlroots and Weston (possibly others) on QEMU with the virtio card. happens on QEMU, and it happens in virt-manager when I do NOT enable GL. (When GL is ENABLED it seems to be fine oddly)
> 
> It introduces odd flickering, Weston's desktop shell flashes when a new window opens, wlroots also acts odd.
> This is QEMU 8.0.4
> 
> I have narrowed it down to 01f05940a9a75e11a2be64993c44ad8dd06e6e26. Reverting the commit (it still reverts cleanly), and the flicking goes away on a rebuild and this is on Linux 6.6.

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: 01f05940a9a75e https://bugzilla.kernel.org/show_bug.cgi?id=218115
#regzbot title: fb damage clips property enablement causes Wayland non-GL flickering on QEMU

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218115

-- 
An old man doll... just what I always wanted! - Clara
