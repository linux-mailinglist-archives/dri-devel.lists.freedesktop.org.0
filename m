Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D71562A063A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 14:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274AA6EDD0;
	Fri, 30 Oct 2020 13:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.codeweavers.com (mail.codeweavers.com [50.203.203.244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AD36EDD0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 13:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=codeweavers.com; s=6377696661; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+nB+YwfIqb74tTrS/a6qPqfwX4fddhIL9l2y/GzfUh4=; b=aAodBY+eEDLriaQaPJMsnxtFjB
 0kmO0kJofd7yoHJqapoekfeRQU9w27WcZw+iNgvFFycRmDlHbrAxXkj3C2xKKVJ+lKeBvicFGoCN0
 uTG84YM4xqWZl1N9OTWkNXGPOf/1qQKzM1iToHNT0Bpma4SABJDDKQYOI8X3c66D/gxk=;
Received: from [10.69.141.123]
 by mail.codeweavers.com with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <pgofman@codeweavers.com>)
 id 1kYU8V-0005Fg-Fy; Fri, 30 Oct 2020 08:08:10 -0500
Subject: Re: [PATCH libdrm 2/2] include: Avoid potentially infinite loop in
 log2_int().
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20201028100602.168752-1-pgofman@codeweavers.com>
 <20201028100602.168752-2-pgofman@codeweavers.com>
 <20201030130739.0e6770c6@eldfell>
From: Paul Gofman <pgofman@codeweavers.com>
Message-ID: <53e2c0c8-edef-ffce-d7ae-f42fd8262000@codeweavers.com>
Date: Fri, 30 Oct 2020 16:07:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201030130739.0e6770c6@eldfell>
Content-Language: en-GB
X-Spam-Score: -40.6
X-Spam-Report: Spam detection software,
 running on the system "mail.codeweavers.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/30/20 14:07, Pekka Paalanen wrote: > On Wed, 28 Oct
 2020 13:06:02 +0300 > Paul Gofman <pgofman@codeweavers.com> wrote: > >>
 Signed-off-by:
 Paul Gofman <pgofman@codeweavers.com> >> --- >> util_ma [...] 
 Content analysis details:   (-40.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 USER_IN_WELCOMELIST    user is listed in 'welcomelist_from'
 -20 USER_IN_WHITELIST      DEPRECATED: See USER_IN_WELCOMELIST
 -20 ALL_TRUSTED            Passed through trusted hosts only via SMTP
 -0.5 BAYES_00               BODY: Bayes spam probability is 0 to 1%
 [score: 0.0000]
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/30/20 14:07, Pekka Paalanen wrote:
> On Wed, 28 Oct 2020 13:06:02 +0300
> Paul Gofman <pgofman@codeweavers.com> wrote:
>
>> Signed-off-by: Paul Gofman <pgofman@codeweavers.com>
>> ---
>>  util_math.h | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/util_math.h b/util_math.h
>> index e2fa95f5..f6bbe192 100644
>> --- a/util_math.h
>> +++ b/util_math.h
>> @@ -38,6 +38,9 @@ static inline unsigned log2_int(unsigned x)
>>      if (x < 2) {
>>          return 0;
>>      }
>> +    if (x & 0x80000000) {
>> +        return 31;
>> +    }
>>      for (l =3D 2; ; l++) {
>>          if ((unsigned)(1 << l) > x) {
>>              return l - 1;
> Hi,
>
> I guess that does it, but it seems quite a lot of code that could be
> a two-liner:
> http://graphics.stanford.edu/~seander/bithacks.html#IntegerLogObvious
>
>
> Thanks,
> pq

Hello,

=A0=A0=A0 thanks, I've sent the updated patches with simplified implementat=
ion.

Regards,

=A0=A0=A0 Paul.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
