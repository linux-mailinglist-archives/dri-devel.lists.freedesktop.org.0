Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F37178367
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 20:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07D26E941;
	Tue,  3 Mar 2020 19:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B79A6E941
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583265092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DvNuRsgrlwxpJev5Ji+2rDTX8ckqvUS3GRbdlLRF5QE=;
 b=hMSqR4BKUgl5kkqZUJru4eKb6ewI8rLuZPCPoDYeL+iDK5zzwW6pcYz/l7CZk9yZZZ0rqe
 pV2JgMgdm2WDYOPiJpzPHQNDn4X02zbeHrtgdBM8EI2WVzXa+vsq8yIOtOBuqAygY+oAS6
 j2+Q6NXkzmVqcEnynqNQe+L8tFQKMgs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-EMrqjjV9Md6a_eLlVtW1-A-1; Tue, 03 Mar 2020 14:51:31 -0500
X-MC-Unique: EMrqjjV9Md6a_eLlVtW1-A-1
Received: by mail-qv1-f72.google.com with SMTP id o18so2808985qvk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 11:51:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=DvNuRsgrlwxpJev5Ji+2rDTX8ckqvUS3GRbdlLRF5QE=;
 b=tJ+ENJEFErlUKDOmLWB+za4hn58LDvJ0/hYuRSh+oiqV2V5/AKRyFeBpZEn05jg88J
 wTzhxchdNqALy+BlATQgvZxG3Z5K1EO9qNZ0b3eRcb1dW9qCGWRoOHKTTGikTgXMEchM
 qeO31Rb+02uoZu87oOTsnuVlVQXdYvjpUD+sSQ5G/BZvgPLMoB5GCswD+ccyyRvGmDm2
 eU1zaeqao/U71ox4zF/MofcuhLauCYT1PzfUUy2E2rZmj7hl/116vUrpi/Wn9X8Rm6+4
 oZWs0W7R3eqUBsBwHpBZYMswGLpP3oCvNQNHl4QM0GZSkzn7oCj4VvTFnOWILsoJdDnX
 AWdw==
X-Gm-Message-State: ANhLgQ0k44FYJAmUqd2sVabaVVzMfT22G8kgYlFvY1UxWbubkFz8pktF
 bi/rAuTh9CCxl3iLHLKLot37qZ21aHKaManxXVHWYpfQ9zJgceJrmT7cxG9kCZQ21Gt+jxp++6O
 MP4dNDLffuUwqUezVIqDicJmWEryD
X-Received: by 2002:a05:6214:144b:: with SMTP id
 b11mr4110002qvy.108.1583265090605; 
 Tue, 03 Mar 2020 11:51:30 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsspg8JhI5ihzXhOt6OuWIKvJocilynLOdCC5Pvwbi3gxDK6VrQZDaw5zx7MH666d9ns8TkKg==
X-Received: by 2002:a05:6214:144b:: with SMTP id
 b11mr4109928qvy.108.1583265089398; 
 Tue, 03 Mar 2020 11:51:29 -0800 (PST)
Received: from desoxy ([2600:380:8e4d:1b16:f190:533c:5a8b:4a57])
 by smtp.gmail.com with ESMTPSA id h25sm2767037qtn.30.2020.03.03.11.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 11:51:28 -0800 (PST)
Message-ID: <faad55e121f844d9b47afa603ad09641a58957b5.camel@redhat.com>
Subject: Re: [v2,1/3] drm/dp: Introduce EDID-based quirks
From: Adam Jackson <ajax@redhat.com>
To: Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Tue, 03 Mar 2020 14:51:27 -0500
In-Reply-To: <20200211183358.157448-2-lyude@redhat.com>
References: <20200211183358.157448-2-lyude@redhat.com>
User-Agent: Evolution 3.34.0 (3.34.0-1.fc31)
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2020-02-11 at 13:33 -0500, Lyude Paul wrote:
> The whole point of using OUIs is so that we can recognize certain
> devices and potentially apply quirks for them. Normally this should work
> quite well, but there appears to be quite a number of laptop panels out
> there that will fill the OUI but not the device ID. As such, for devices
> like this I can't imagine it's a very good idea to try relying on OUIs
> for applying quirks. As well, some laptop vendors have confirmed to us
> that their panels have this exact issue.
> 
> So, let's introduce the ability to apply DP quirks based on EDID
> identification. We reuse the same quirk bits for OUI-based quirks, so
> that callers can simply check all possible quirks using
> drm_dp_has_quirk().

With the bug URL fixed in 2/3, series is:

Reviewed-by: Adam Jackson <ajax@redhat.com>

- ajax

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
