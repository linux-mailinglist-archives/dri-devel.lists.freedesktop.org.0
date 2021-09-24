Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CCF418048
	for <lists+dri-devel@lfdr.de>; Sat, 25 Sep 2021 10:26:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9266E39B;
	Sat, 25 Sep 2021 08:25:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3595A6E1FB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 18:45:17 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x27so44141586lfu.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Sep 2021 11:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m2iFyVRqF7JrTp6QDZItfgtnWo37FQxEFmKps2jtPzg=;
 b=OHdLmHLUqYMG97VLrcmQXdDx14IM4tQJrv1lyMkxEPAuaXq6/7g2Lr1LO1DKyS5gzh
 qRSQeVNt8FsQbVN/z9sixdtNtukLmnovQwuQm943ZeBsPjRI+yelst8FiHhSu84eQvpm
 uwWFuXxFng+iWO6C35TK2UHWuC0lmMMY6V4kkfuSePInNjwPTQjCQ9DD1z/s4rFmasRE
 YIIB1LOHSq/ugyQhqu+Rqgdg2i7/g+yKXjMGVBNRojbJtnEt59bj/DwciR5RTy9KI4+H
 ECqB10eCn5rVBofLmEdxpq3s8bhsy58Ngm3A4/3R9posrPNa0XjNzPivWWB4EJFK7V22
 aeZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m2iFyVRqF7JrTp6QDZItfgtnWo37FQxEFmKps2jtPzg=;
 b=vsAxrPTt1oYSuYchavSOfBbOgSzRpD9vWohYJVQT9NYYwnzEwb8hWOcYORtMhUxS50
 t+UADA70rINxmaLLljNSkeSJ/eH7RdolmerKhJ43MDOu2mknwtOI/Tkf+qDvS+wtr5Nr
 K3/GGYJrTaa+gYNm+1hYITCVK1TxsKUeBbWJAbUKQhQH6a6bpDNR62lsbmsuPfXjv3lU
 Uf+XMpwrmkpLYQgpPcI2OCSJnk4v8ybkxf8FvXnE5NLJJUPstI9/MduZ46IEHYjRK6ot
 r/pOXLISGfGglBIWQi6uwEqexn5b3I9YM4yU6c/el0WxTqzT5SW972KPy5zbaiAByhDf
 ILBA==
X-Gm-Message-State: AOAM531QUsPGJ4jJEcO5U7CGg2IJFQ7XJpYspfxVGOU5AzVyBmG5Yrou
 mi227Yoi3YfMtzc4a8Z9w93UhGkhDVw=
X-Google-Smtp-Source: ABdhPJwiUCknqwxZc4gRx1G+PvwpDlR36pCtWKszoumhAo5e6zDCtUmA+nVlYBKCZgme02bsB3KTGA==
X-Received: by 2002:a05:6512:33c3:: with SMTP id
 d3mr10861063lfg.194.1632509115541; 
 Fri, 24 Sep 2021 11:45:15 -0700 (PDT)
Received: from ?IPv6:fd00:835b:d940:d4fc::5?
 (2a01-036c-0113-a176-0000-0000-0000-0005.pool6.digikabel.hu.
 [2a01:36c:113:a176::5])
 by smtp.gmail.com with ESMTPSA id o7sm799223lfr.216.2021.09.24.11.45.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 11:45:14 -0700 (PDT)
From: "=?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=" <dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?=
 <DirtY.iCE.hu@gmail.com>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
 <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
 <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
 <a9839860-6e13-4809-9a85-96821ae5372e@www.fastmail.com>
 <dee32db0-fb9c-4b09-0c8f-e602c60b23d8@gmail.com>
 <ad933c42-a02e-b818-7f42-98620036b0d3@suse.de>
Message-ID: <1ab2f853-369e-f30c-06a5-f4ba97d4278e@gmail.com>
Date: Fri, 24 Sep 2021 20:45:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:4.8) Goanna/20210217
 Interlink/52.9.7718a1
MIME-Version: 1.0
In-Reply-To: <ad933c42-a02e-b818-7f42-98620036b0d3@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 25 Sep 2021 08:25:39 +0000
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

Hi,

On 2021-09-24 20:19, Thomas Zimmermann wrote:
> Ask Nvidia.
I've tried nouveau in the meantime, but it takes over simpledrm (and 
changes the screen resolution and turns on the secondary display), so 
it's completely different. And it also works, at half the performance.

>> Any ideas what should I try? Everything worked well with 5.13 and its 
>> simplefb.
> 
> I'd suggest to go back to simplefb for a while and maybe try simpledrm 
> occasionally.
Oh, I was under the impression that simplefb was removed from the 
kernel. It turns out it just has `depends on (FB = y) && 
!DRM_SIMPLEDRM`, so it didn't show up in the config after I enabled 
simpledrm. Ouch.
Based on a quick test, simplefb fortunately still appears to work.

Thanks,
Zoltan

