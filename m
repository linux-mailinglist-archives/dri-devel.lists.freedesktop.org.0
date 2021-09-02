Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B1F3FED47
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 13:56:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AE26E4F3;
	Thu,  2 Sep 2021 11:56:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D51A6E4F3
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 11:56:11 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id ay33so1635461qkb.10
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Sep 2021 04:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HmG+SzrqI25IfuOzYDDubE9mgxl445AA/VbS1PiElag=;
 b=mSo12sAwclW6At6xkB9mlrVJ+Tc5FkqDtEY9LlDtlFK+hxBuTNvTDbNpFL1xxTFNlF
 nwDxpSko/dvgY9CnDlh6ty1+2auJybtEU1Asz0VwepEiBdzfLWvQVHZaVUCFa1NcrIbP
 0756JE6st4fVmFOBe5pas+MDy6lTF+uMPvBbelLD09/zofzYLbhF3peAr0gh5TSdxgSj
 vGdJwUXHFGNSFIya472jKpvz/TmVROAC0XByV5AAea/3S8FYelU9Pmmx3T56kGSnwX6N
 YSYN+Tn2seNFplpmMvZouN1DaPkG8f1OHvjQ4TwMjA+uPq8+oQZZNPHcnG04B7q52o6H
 +9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HmG+SzrqI25IfuOzYDDubE9mgxl445AA/VbS1PiElag=;
 b=CxKuyGN9lu/HOjOhB2/nvS5GB0sEaWOk5riso94W5171Yc8Itl3DtZaVtVeaaWIiL8
 GVuGh2KI5/uXBzpVEdlLx+MKRsdMbZ84nq8p1K8Rcb02mSt3cXnH24kq1oiShuo1Bqq+
 arhU1Zf/zKYR/oq+UWm5yNLAr+uCEmCSQTvm8qvzZMy+iYvJYk9wjr0jlC9BKTo8rDO6
 wazKymk3wNFFdfY2vswxT/5TOn4XstCGmi2Y3SyrSCLm/DRwOK9/SCSDRdUuphlbvf99
 FR5PasdPSzQeGnQ6yn7r4SK2SCd7H2nH1Rd4hnQaiKMPIL++c7LGH6TTP37PMl/FBeYr
 SoAg==
X-Gm-Message-State: AOAM5301z1FPFaSMQtt2ujZ623BQiLTHTR1lqkXlHTJPeBj3gmkBOe5O
 vB7j7XWmJcfBs77s5H4MICo=
X-Google-Smtp-Source: ABdhPJzfScLfeuE+0zAzb7fUqVmoYa1Qsnj1IFjKnXefyb+6m30XuswOw0QGO3EbayUr06CRv/J2rQ==
X-Received: by 2002:ae9:ed53:: with SMTP id c80mr2846027qkg.402.1630583770159; 
 Thu, 02 Sep 2021 04:56:10 -0700 (PDT)
Received: from [192.168.15.25] ([186.204.255.226])
 by smtp.gmail.com with ESMTPSA id v7sm1256373qkd.41.2021.09.02.04.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Sep 2021 04:56:09 -0700 (PDT)
Subject: Re: VKMS: New plane formats
To: Simon Ser <contact@emersion.fr>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <d1ceaa32-e143-8d3c-4bfb-7b31673cc76c@gmail.com>
 <Qkd7rIf9j9Y-IlDoCbF8VB8T5sIKykTIuTfZIc1pCFPfvnfwIBGOMTnFo8i5jAWqGitlGEBH865MLF3C2jdIVk7TbRRFb_KVlte_FI0hjgI=@emersion.fr>
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Message-ID: <22b20ed0-f3d1-c70c-1f3d-ca897330f7c6@gmail.com>
Date: Thu, 2 Sep 2021 08:56:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <Qkd7rIf9j9Y-IlDoCbF8VB8T5sIKykTIuTfZIc1pCFPfvnfwIBGOMTnFo8i5jAWqGitlGEBH865MLF3C2jdIVk7TbRRFb_KVlte_FI0hjgI=@emersion.fr>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/1/21 5:24 PM, Simon Ser wrote:
> Ideally the final composition format would have enough precision for
> all of the planes. I think it'd make sense to use ARGB16161616 if the
> primary plane uses ARGB8888 and an overlay plane uses ARGB16161616.
> 
> To simplify the code, maybe it's fine to always use ARGB16161616 for
> the output, and add getters which fetch an ARGB16161616 row for each
> supported plane format.
> 

This makes sense to me. I will try to implement this way.

Thanks!
