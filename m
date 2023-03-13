Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F9E6B7313
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 10:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A00A10E12D;
	Mon, 13 Mar 2023 09:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED46010E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 09:48:02 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso10454427wmq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Mar 2023 02:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678700881;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fO9QX/weVED953xL0vn6RIJmflSaqBS+exrgijHj8oI=;
 b=b85l8WtrWPlHcTYMcC9XmvuPHxmv1YATlNgiwIEpU6zuBiAVQyWFjwj9/gnjIHRpd2
 T7tomEtNXfmsUqRuciHXT/4gfRFgBhbHNQf8vrMQv7vKFCBTsLBjGkrVpPEHhuUmEiZ3
 qgw9driJQRHzBt8/v7DKZHZqXizLbdXPspu2m/At76e5mbFFMvLUhgC3+4vaGhlbYDsJ
 DX+SLvi91f6DlxqbfM/2DgLKPr7UMCia1hIc7Q3bpmgL5DcFqDkZRlBIyIvCCqhU0Ziv
 Eklb3mVfbgSOZOmno1vofozalXoVYmalU86AMcJKW1S4i4SSeB3r61DUnfMcLG5JwiDf
 ziOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678700881;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fO9QX/weVED953xL0vn6RIJmflSaqBS+exrgijHj8oI=;
 b=p7bCanR2OVtER3+WDztB7BtYUbYB1taTkjeio4qs0+vHKoTtfROy0HEiXS4mc4NjDq
 Gx+OQ2MFfSm0tmnNelSox2FE/cl3/c7odxQ5DflAARkVzleuO1wA5OIG2sHNbe9blel7
 GGWIaynZQQTIvnrrfo98aBlrN+XqN4YStiNsEMOIsAMQKB4SgGL9rpTDD9AC/NIf9T+Y
 XvIMgtg3gDpBPtHcQNjzhNvtG1GhmjR+dnTCGqpMVYYZ0/f3gRzz9q+zoOPCZtoBZvov
 2bymPgn1M5pThVjoaecdz5BdbeVHLCp/TcNzkHi4tqY8NgKtUs6F/sHH+n3IZtaXFDW1
 wh0Q==
X-Gm-Message-State: AO0yUKW2whEPkMW2gezsYr4feGY/Y/Vcpwu5fg8tiyEVFbqWzN6fHOMN
 ukCJBAb+vcU+dM5na27vJvPbSw==
X-Google-Smtp-Source: AK7set/TwMkM6ahPLSMJJugMHuvHZmsV7Rsb041IebIpECvIRczfyVk1f5r4t2Z9zCTS/4XbIFxxQg==
X-Received: by 2002:a05:600c:4f86:b0:3ed:29d9:56ae with SMTP id
 n6-20020a05600c4f8600b003ed29d956aemr191186wmq.6.1678700881411; 
 Mon, 13 Mar 2023 02:48:01 -0700 (PDT)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c2f1000b003ed29189777sm980898wmn.47.2023.03.13.02.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Mar 2023 02:48:01 -0700 (PDT)
Date: Mon, 13 Mar 2023 09:47:59 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] backlight: as3711: Use of_property_read_bool() for
 boolean properties
Message-ID: <20230313094759.GB55049@aspen.lan>
References: <20230310144731.1546190-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144731.1546190-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 10, 2023 at 08:47:31AM -0600, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
