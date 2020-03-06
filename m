Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8235917BB21
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 12:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8595B6ECD5;
	Fri,  6 Mar 2020 11:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A916ECD5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583492703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Vd4lXmmBZJECiSqYOl3s7WemhxZZt5CNTvS6vYMPFM=;
 b=LbrbyZzgy63Zkv8NOSK58EaHB8dgjzjtcJjpExjXd1xuN+Yrzjum20z84UsQDVDW7JT69s
 v2DfgBOZMI8n6ENvjU+I/z5NZdhVzR4OpMVCcgGggJTNMHFm345L7ziPAOej28xSqyf+RK
 HcOTJyMaQLAwY12Tc2IwD9YG/lLheTI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-mfz9dfrhNVyeTSmnOutDKA-1; Fri, 06 Mar 2020 06:04:55 -0500
X-MC-Unique: mfz9dfrhNVyeTSmnOutDKA-1
Received: by mail-wr1-f71.google.com with SMTP id q18so849765wrw.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 03:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Vd4lXmmBZJECiSqYOl3s7WemhxZZt5CNTvS6vYMPFM=;
 b=uUKmSUyV7QfXEXvfWDUvfZkA5WCdimZQUNkLSV9PW/6fe2qdRJY5E9E7l1svayUnvU
 hOvWqFvK0Gv5FFE5QfmhBpbeMSjUGutqBmyBP+2miSHLSO1sUiWrGUyF0ebBJavcCQdV
 DSR6Ml/yqMzowTfJGlvvY2qqDaNtFg3Twt51h31TfD5zuuGQtzE52ApWlokvCAhqWL+9
 zKhsPpm6x7AbneEXcXZR/PRupR6TlAchp0NWlBBWbotw1zqt8Q5o92Afgvi1rbNQEJEd
 bUn7FFOUNlHkq8B8wTGF+aAdlniensXUlaetq9Sm5VbtkGjRvFsY/Iv1nqitQJBphUOK
 88rw==
X-Gm-Message-State: ANhLgQ1h3fTt6uiwmuDtGoJoM0Sk37zK+jT3LlO5+cFqXO9Pw+wYVcs4
 RYp3aXdPJ69/+DEgvBx7s1hvFnpy36AlWMsWIPm4q5SULcZTwxveR7tx15i2Egd3GTEcmTzp+oY
 K6xA3CUml+gC/5Iu7iEi34sjSYAda
X-Received: by 2002:a05:600c:581:: with SMTP id o1mr3507755wmd.8.1583492694003; 
 Fri, 06 Mar 2020 03:04:54 -0800 (PST)
X-Google-Smtp-Source: ADFU+vu7+UUGyrJbYNEJnOT9VcmpJO5hckGHBjC0pdy9GLX2QkWv1D5IkKHrCWu6PX+2j4ofwCJ6FQ==
X-Received: by 2002:a05:600c:581:: with SMTP id o1mr3507730wmd.8.1583492693730; 
 Fri, 06 Mar 2020 03:04:53 -0800 (PST)
Received: from x1.localdomain ([2a0e:5700:4:11:42c0:3c5d:2f33:1a6c])
 by smtp.gmail.com with ESMTPSA id v16sm31228537wrp.84.2020.03.06.03.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 03:04:53 -0800 (PST)
Subject: Re: [PATCH][next] drm/vboxvideo/vboxvideo.h: Replace zero-length
 array with flexible-array member
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200305105558.GA19124@embeddedor>
 <8e2ab9a2-fb47-1d61-d09c-0510ad5ee5ff@redhat.com>
 <20200306104118.GV2363188@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b6b0d74d-f08a-e5af-b17c-899d6d6da487@redhat.com>
Date: Fri, 6 Mar 2020 12:04:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306104118.GV2363188@phenom.ffwll.local>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 3/6/20 11:41 AM, Daniel Vetter wrote:
> On Thu, Mar 05, 2020 at 03:22:38PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 3/5/20 11:55 AM, Gustavo A. R. Silva wrote:
>>> The current codebase makes use of the zero-length array language
>>> extension to the C90 standard, but the preferred mechanism to declare
>>> variable-length types such as these ones is a flexible array member[1][2],
>>> introduced in C99:
>>>
>>> struct foo {
>>>           int stuff;
>>>           struct boo array[];
>>> };
>>>
>>> By making use of the mechanism above, we will get a compiler warning
>>> in case the flexible array does not occur last in the structure, which
>>> will help us prevent some kind of undefined behavior bugs from being
>>> inadvertently introduced[3] to the codebase from now on.
>>>
>>> Also, notice that, dynamic memory allocations won't be affected by
>>> this change:
>>>
>>> "Flexible array members have incomplete type, and so the sizeof operator
>>> may not be applied. As a quirk of the original implementation of
>>> zero-length arrays, sizeof evaluates to zero."[1]
>>>
>>> This issue was found with the help of Coccinelle.
>>>
>>> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
>>> [2] https://github.com/KSPP/linux/issues/21
>>> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>>>
>>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>>
>> Patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> You're also going to push this? r-b by maintainers without any hint to
> what's going to happen is always rather confusing.

Sorry about that, atm I'm on the road which makes pushing things somewhat
inconvenient, so if someone else can push this, that would be great.

Regards,

Hans





>>> ---
>>>    drivers/gpu/drm/vboxvideo/vboxvideo.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo.h b/drivers/gpu/drm/vboxvideo/vboxvideo.h
>>> index 0592004f71aa..a5de40fe1a76 100644
>>> --- a/drivers/gpu/drm/vboxvideo/vboxvideo.h
>>> +++ b/drivers/gpu/drm/vboxvideo/vboxvideo.h
>>> @@ -138,7 +138,7 @@ struct vbva_buffer {
>>>    	u32 data_len;
>>>    	/* variable size for the rest of the vbva_buffer area in VRAM. */
>>> -	u8 data[0];
>>> +	u8 data[];
>>>    } __packed;
>>>    #define VBVA_MAX_RECORD_SIZE (128 * 1024 * 1024)
>>>
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
