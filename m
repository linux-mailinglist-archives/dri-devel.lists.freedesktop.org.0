Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E28611EC3
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 02:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA4A10E914;
	Sat, 29 Oct 2022 00:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8179610E914;
 Sat, 29 Oct 2022 00:43:40 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id u6so6196575plq.12;
 Fri, 28 Oct 2022 17:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=emP2KuZFwj43eFZPPui8vytef4MIQe1Qy4avTg2orQg=;
 b=jL/I05N9IZ4Mufeh10+xFyT6RfOPoytViWgMLC/woi3Ch5bYYBbbIoVsLZxPpuGB6E
 oFkR0UqOo/t/UlSzX0qxVeFbL0XVkLxVh/NF4PFn/FgdsjBPZlyXpBZPHydb0aQMDJn0
 mGzuhrtOcScBvmPjkcGPwdcLpDMdgV8p5LhkqR2rJN9JMtW00AaxJx4KClQPw3sCbuRS
 WXs+tu1qUcRh4vGXiknLEg0uC3RpQf15HGFlnhSAcKTz/Ub3eI+uzYjrnZNEdjy7C680
 PK5oJtjkRpYdWG6bHVLeDrEID/9fH8UG7smKr16CJb08jP9kII/Tdn0vUqDZLQZoEE2c
 V0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=emP2KuZFwj43eFZPPui8vytef4MIQe1Qy4avTg2orQg=;
 b=3i30XJweRhkrajVGKwXsdTmv0dR9HjrFTdO3McQrpN2RIruXjSlmrmFAAtRXWhtu4I
 jPOeeg+t0ypiH7LqyXHRLXGy0jFb/MTe1zR183guq2BCZXFpOBMxiRXd/zs/37JDokm5
 2mMVFJ6GBzHE1z8IcU1bPwUCDu9uOAuFQ7DFihl2/nglLe4VDuwsWG1dZE5cdbTkFunB
 llygokRVeZuddql+0/j+r62IkmtdqR+t7KptzRg48SXsD6rvxL+3kFhUOpqv2ZzSHpBs
 Q9/4O9oYBT8Y+k02whuRLTeZDTKenEQXPZmoBHvmbDvfOHEug/ROfQukfnuMRKfVV4tw
 fOIA==
X-Gm-Message-State: ACrzQf1SMwPFav3bEENPvY3AcX91b74s0oiHAD0HJaqctIVKqlbADSlC
 0CNiWLKaYMYuIdAQHIgOUqc=
X-Google-Smtp-Source: AMsMyM64/WABEHWKiRZHSiSa7EhGnCTWdeRCZzpmdY8svnnd1cYqe59ICTB7Kf3PEvSIaWXs/GTFkg==
X-Received: by 2002:a17:902:f791:b0:17c:c1dd:a3b5 with SMTP id
 q17-20020a170902f79100b0017cc1dda3b5mr1751822pln.141.1667004219965; 
 Fri, 28 Oct 2022 17:43:39 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 a2-20020a170902900200b0017f9db0236asm62880plp.82.2022.10.28.17.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 17:43:39 -0700 (PDT)
Date: Sat, 29 Oct 2022 13:43:30 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH] [next] drm/amdgpu: Replace one-element array with
 flexible-array member
Message-ID: <Y1x3MtRJ8ckXxlJn@mail.google.com>
References: <Y1tkWdwPUp+UdpM0@mail.google.com>
 <04e37ee1-53b0-97ab-d6d7-a39edfbdc2ea@amd.com>
 <202210280855.9DF8E4D72@keescook>
 <1052fba8-11ac-cec8-92e7-b994266c6970@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1052fba8-11ac-cec8-92e7-b994266c6970@amd.com>
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
Cc: Kees Cook <keescook@chromium.org>, Grigory Vasilyev <h0tc0d3@gmail.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Slark Xiao <slark_xiao@163.com>,
 Hans de Goede <hdegoede@redhat.com>, Claudio Suarez <cssk@net-c.es>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Rongguang Wei <weirongguang@kylinos.cn>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 07:33:17PM +0200, Christian König wrote:
> Am 28.10.22 um 18:36 schrieb Kees Cook:
> 
> > All that said, converting away from them can be tricky, and I think such
> > conversions need to explicitly show how they were checked for binary
> > differences[2].
> 
> Oh, that's a great idea! Yes, if this can be guaranteed then the change is
> obviously perfectly ok.
> 
> > 
> > Paulo, can you please check for deltas and report your findings in the
> > commit log? Note that add struct_size() use in the same patch may result
> > in binary differences, so for more complex cases, you may want to split
> > the 1-element conversion from the struct_size() conversions.
> > 
> > -Kees

Noted. I will reporting my findings on commit logs from now onwards. 

Given that I split the if-ternary to avoid checking "fake_edid_record->ucFakeEDIDLength"
twice then (for the current patch), yes, there will be changes to *.o|ko files.

Knowing that Christian would feel more confident with no binary changes
at this point, I will send a different patch aiming solely on the
replacement of 1-elem array without incurring binary changes.

--
Paulo A.

