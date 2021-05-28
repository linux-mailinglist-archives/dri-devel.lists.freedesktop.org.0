Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41F394315
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 14:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071A46E507;
	Fri, 28 May 2021 12:59:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0958F6F5B3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 12:59:32 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id v8so3969014qkv.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QkS67PNWJLrMlG0Eh1DFrl12I+MHfh0CuXPqyN2o9Jk=;
 b=RoE5+ne+IEtUIwJTmkaKAmIW8xmlFFiZyFu+RXc8Xtk3xP3WS2cnNmBkmt0rGcwaq/
 qb2PuixGE3rnUfQLjmTJ60OtadS6WqwIMVT+H21njXbcac9gUxl4ua+OaRnV6dmBPQGk
 cCjgQ0xixLesraJ7oA4Tw1q7d1IW86tp8+qcQKQmnLrhSW2W5PPT0vIu/dA7120u6STL
 lP8WtyfVW1q00VzSS8n+0giUcaceB12ncIClUcgKgzU6JWAGYtnVT6Fs+IJQA/a+kbEy
 bbqVyqPOW610wOc+b5AIAlA2tuOsdLLB6pV2bXvQM/3xs04eGLgpqeh/VYCtDPtFmGeu
 NfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QkS67PNWJLrMlG0Eh1DFrl12I+MHfh0CuXPqyN2o9Jk=;
 b=ll+9FuHxIMVLOAvFp+0QFxmkmvLKEiufcUIjONIgdghOFwbGh6qkUNVGL/jYszZyL0
 vNp89wmDKqOEgV4NhmGbuw9GJMMlJng9hf73YLz+bOdZRIDi4ePV0pxptyREOvG+OwMO
 bO8tTFJAWGWYHtELAeUZuhiXaYVmf2IHNr9+kRZTaftFBdOd7Ww4/YH8DzVu+wljoEmY
 LRRLqKk+cIjud7CMnloUK9X1CqGhMA9Z2VFMkbuY2U11rsLLL39s++2fJEZ3zT/8YYja
 NtsfAZZHhN8A7fl7Sr48jOupx2U1OaouhdLgR5J5aj1qRgOco3Q/0LnfMpT21RQXh3U+
 rmGA==
X-Gm-Message-State: AOAM530zNrUm49yY0kS21qSSqOARHc12G+SVlk2qsFDUFn7V/9FiOSTP
 cFvsB2tAllDMF6VxYxu+4vb9WQ==
X-Google-Smtp-Source: ABdhPJzrZ6/fmuomvi1UY7oEviJSluEuJL6Gjb+/l1q88tzyHFRCD8yK7EweolQnqF3+MS3DPRFyUQ==
X-Received: by 2002:a05:620a:745:: with SMTP id
 i5mr3821434qki.324.1622206771962; 
 Fri, 28 May 2021 05:59:31 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d6sm3525975qkf.109.2021.05.28.05.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 05:59:31 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom, dsi-phy-cphy-mode option
To: Rob Herring <robh@kernel.org>
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-3-jonathan@marek.ca>
 <20210503171139.GA2011901@robh.at.kernel.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
Date: Fri, 28 May 2021 08:57:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210503171139.GA2011901@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/3/21 1:11 PM, Rob Herring wrote:
> On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
>> Document qcom,dsi-phy-cphy-mode option, which can be used to control
>> whether DSI will operate in D-PHY (default) or C-PHY mode.
> 
> Given this is a standard MIPI thing, I think this needs to be a common
> property. We already have phy bindings that use the phy cells to set the
> phy type which I think you should use here. See
> include/dt-bindings/phy/phy.h.
> 

Is it OK to simply change the option to something like "phy-mode = 
<PHY_TYPE_DSI_CPHY>;"?

(using phy-cells would be annoying to implement, with no benefit IMO)
