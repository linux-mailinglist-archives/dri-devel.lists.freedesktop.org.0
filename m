Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63305261BF
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 12:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494C3898F1;
	Wed, 22 May 2019 10:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 388 seconds by postgrey-1.36 at gabe;
 Wed, 22 May 2019 10:31:17 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16930898F1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:31:16 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20190522102447epoutp02fc023619b70e44c4fb2d7279ed737323~g_k7Qv7w32711527115epoutp02U
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:24:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20190522102447epoutp02fc023619b70e44c4fb2d7279ed737323~g_k7Qv7w32711527115epoutp02U
Received: from epsmges1p1.samsung.com (unknown [182.195.40.153]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20190522102444epcas1p35d0ce260ab15776172853cdf2ca8f69f~g_k4ErNtH2756427564epcas1p3B;
 Wed, 22 May 2019 10:24:44 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 88.2F.04139.B6325EC5; Wed, 22 May 2019 19:24:44 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190522102443epcas1p3212e857e0759cd06fe504d2542ec6e9a~g_k3u6ozi1638016380epcas1p3F;
 Wed, 22 May 2019 10:24:43 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190522102443epsmtrp182c16c91e86beeb90891d2091c11c4ea~g_k3uO80g2648726487epsmtrp1N;
 Wed, 22 May 2019 10:24:43 +0000 (GMT)
X-AuditID: b6c32a35-973ff7000000102b-11-5ce5236baa75
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 2F.71.03662.B6325EC5; Wed, 22 May 2019 19:24:43 +0900 (KST)
Received: from [10.113.221.105] (unknown [10.113.221.105]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190522102443epsmtip262f01aa69b9e996c6bf28fbe63e41598~g_k3lO4ZD0822008220epsmtip2G;
 Wed, 22 May 2019 10:24:43 +0000 (GMT)
Subject: Re: [PATCH] drm/vc4: Fix with pm_runtime synchronization on DSI
To: Eric Anholt <eric@anholt.net>, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, Hoegeun Kwon <hoegeun.kwon@samsung.com>
From: Hoegeun Kwon <hoegeun.kwon@samsung.com>
Message-ID: <77366d2d-9239-2fb3-9938-0d270c52867c@samsung.com>
Date: Wed, 22 May 2019 19:24:47 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87ftqrno2v.fsf@anholt.net>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA1WTe0hTcRTH++3uXme1uK3Mg0XO28OKrN3W6hYqPSwGWhlRhA7WRS9q7sXu
 tBeBWZpu5qOsaGVJWFJB9pBmkRauLBcJmb1LzSyy18qY9KKa+y2w/z7n/L7ne37n95ARijdU
 hCzLZBOsJt7AUMOll9zTVTGGSa91qtpl3J62Vgn351IFwXX4vBR3fcd9xHlr7dQiUpvvbaG0
 jQPVUq1roJvUdjluSbSl9adRMpmSHZsp8OmCVSmY0szpWaaMOCZxjX6pXjNPxcawC7j5jNLE
 G4U4JiEpOWZ5lsHfnFHm8oYcfyqZF0Vmdnys1ZxjE5SZZtEWxwiWdINlgWWWyBvFHFPGrDSz
 cSGrUs3R+IUbsjO/t3wgLY0X0eb2umKUh46dQnYUKgN6Lrg7b1B2NFymoBsQFF79gXDQj6Dp
 ZhmBgwEEBXXnJHYkC5RcPGrA+UYEB/paQ3DgRfC5/BE16DuG1sLz728DvmPpcgTFt5sCCxQd
 A76SR5JBltPx0F/jCLCUngJub3uAw+j10NVyjsSa0dB6qFc6yKH0NOg90R9ggl4HZ4odFOZw
 eNp7TIIHekbB8feT8U4TwJlP4vQYeHerPgRzBPSVFQZZhI5D76SD+wQ6D0FZxeHgghqundgX
 9IyCyz+rEO41Cj75SkjsL4eiQgWWTIU3edeDvSaAZ09tsFQLZ3qeB08xXwJenxuVo0jnkNGc
 Q8ZxDhkHcyS4Ph4hnP52BD0d6q7MxumNUFFmJzBPg4IjVSH/y7HNtY7CIEdBpeNlUBMNnqs1
 RDUacRqNEyyiMUMQWQs79OFcQIE3PkPTgCrbkpoRLUPMSHl35yudguRzxS3GZgQyghkrv+Pp
 0Snk6fyWrYLVrLfmGASxGWn8t1lBRISlmf0/xmTTs5o5arWam8vO07AsEy7Xj3iiU9AZvE3I
 FgSLYP1XJ5GFRuQhbRO5yTOl3sw1P9iZur7ENVE9vibF2fG6a1Nr6mNiSfvMr+8T7x72dFep
 I0s8IbsO+m47dhe4N6xKzv21bNvq1PCiLy8sS3X7z5fS1d+iv9X1cWt/K1dub7gQtvfeitI2
 ebyLl4opRQmxsLDTtTjf1hu99mTUsHUPz36le0Zp/iRMZaRiJs/OIKwi/xfIDmXk+QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplkeLIzCtJLcpLzFFi42LZdlhJXjdb+WmMQct3NYvecyeZLP5vm8hs
 ceXrezaLA42XGS3eL+9ic2D1aHp/jM1j77cFLB7bvz1g9bjffZzJo2/LKsYA1igum5TUnMyy
 1CJ9uwSujG1zDAr+yFa0XnjC0sD4VryLkYNDQsBEYvO8nC5GLg4hgd2MEjPbNrF0MXICxWUk
 VvVvYYWoEZY4fLgYouYto8TGnbsYQWqEBTwk7vx8wQaSEBGYwCgxZeV2VoiqBiaJw4+Pg1Wx
 CehKfO25zgRi8wrYSXxa0g1mswioShx+fwnMFhWIkDjzfgULRI2gxMmZT8BsTgENiSdLP4HZ
 zAJhEvPX/WeGsMUlbj2ZzzSBUWAWkpZZSMpmISmDsM0k5m1+CBWXl9j+dg6QzQFkq0ksa1VC
 Fl7AyL6KUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4crS0djCeOBF/iFGAg1GJh9fi
 4eMYIdbEsuLK3EOMEhzMSiK8p089ihHiTUmsrEotyo8vKs1JLT7EKM3BoiTOK59/LFJIID2x
 JDU7NbUgtQgmy8TBKdXAKN1sc01ar64/o16y4iinrv6tb8ePrPom0P2zzK6N+7nYr2t5ayRn
 XnVZzGjyiyuvtOqD+r/1jgJJ1vJFG5IZmi7Pyv7+RPnywp1PC75NMrfpeqSyVXbv3g9vftTy
 8+77I7L9ZLplQPqDKqvtF3ni3l86ovFzw9KuLimnDxuOr0kJuvP68op5s5RYijMSDbWYi4oT
 AQJP6WWYAgAA
X-CMS-MailID: 20190522102443epcas1p3212e857e0759cd06fe504d2542ec6e9a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190329012926epcas1p3fbfa796a221c2fd105a84c31c80016d5
References: <CGME20190329012926epcas1p3fbfa796a221c2fd105a84c31c80016d5@epcas1p3.samsung.com>
 <20190329012913.29538-1-hoegeun.kwon@samsung.com>
 <87bm1p1usk.fsf@anholt.net>
 <9adb599d-3be3-2103-0169-dcd9a497b78a@samsung.com>
 <87ftqrno2v.fsf@anholt.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=samsung.com; 
 s=mail20170921; t=1558520687;
 bh=ypFvXIWZjzLCi1CoWRty7pxsGUIel+XM7UyzbhV7gXQ=;
 h=Subject:To:From:Date:In-Reply-To:References:From;
 b=NxYRqIYlPv+ApvbUZJDZ7iLuPcE6YzkExL41qPP4uWSYBXzKnxqFWiYHFwuvvuBH8
 GsT70NYfad8rGJruowBPkd04ntK5vIUkJjxSzREScIeUEuG9urElTXH969CIe9PRPo
 lJTzXoFqcLOF0kQj/m00P4Uu3XhD8hKct66Gokzc=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0294233028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0294233028==
Content-Type: multipart/alternative;
	boundary="------------BB2D361B65F6BE0F10EE23B9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BB2D361B65F6BE0F10EE23B9
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On 4/10/19 1:24 AM, Eric Anholt wrote:
> Hoegeun Kwon <hoegeun.kwon@samsung.com> writes:
>
>> On 4/2/19 2:48 AM, Eric Anholt wrote:
>>> Hoegeun Kwon <hoegeun.kwon@samsung.com> writes:
>>>
>>>> There is a problem when often dpms goes from off to on. pm idle is not
>>>> in sync and the problem occurs. Modify pm_runtime_put from
>>>> asynchronous to synchronous.
>>> Why would we need the power domain to go to off before we try to come
>>> back?  Any idea?  Also, please specify what "the problem" is.
>> Hi Eric,
>>
>>
>> First thank you for your review.
>>
>> There is a problem failed to runtime PM enable on DSI when often dpms
> What do you mean by "failed to runtime PM enable"?  The
> pm_runtime_enable() returned an error?  Have you investigated the source
> that error, if so?

I'm sorry for the late reply.

The pm_runtime_enable() is not returned because return value is void.

The problem is that if the error log is not output
and the DPMS off on is repeated, the screen will stop.

As a result of debugging the problem, I think that synchronization
is a problem caused by dsi pm_suspend and resume.

So when we entered the pm runtime idle state, if used with sync,
the problem does not occur.

Best regards,
Hoegeun



--------------BB2D361B65F6BE0F10EE23B9
Content-Type: multipart/related;
	boundary="----tU7OzLh4x2RFN_-4cPX1qtoRf7UObRrEIypeiIlPLbux9tBn=_3798c_"

------tU7OzLh4x2RFN_-4cPX1qtoRf7UObRrEIypeiIlPLbux9tBn=_3798c_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 4/10/19 1:24 AM, Eric Anholt wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87ftqrno2v.fsf@anholt.net">
      <pre class="moz-quote-pre" wrap="">Hoegeun Kwon <a class="moz-txt-link-rfc2396E" href="mailto:hoegeun.kwon@samsung.com">&lt;hoegeun.kwon@samsung.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 4/2/19 2:48 AM, Eric Anholt wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hoegeun Kwon <a class="moz-txt-link-rfc2396E" href="mailto:hoegeun.kwon@samsung.com">&lt;hoegeun.kwon@samsung.com&gt;</a> writes:

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">There is a problem when often dpms goes from off to on. pm idle is not
in sync and the problem occurs. Modify pm_runtime_put from
asynchronous to synchronous.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Why would we need the power domain to go to off before we try to come
back?  Any idea?  Also, please specify what "the problem" is.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hi Eric,


First thank you for your review.

There is a problem failed to runtime PM enable on DSI when often dpms
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What do you mean by "failed to runtime PM enable"?  The
pm_runtime_enable() returned an error?  Have you investigated the source
that error, if so?
</pre>
    </blockquote>
    <pre>I'm sorry for the late reply.

The pm_runtime_enable() is not returned because return value is void.

The problem is that if the error log is not output
and the DPMS off on is repeated, the screen will stop.

As a result of debugging the problem, I think that synchronization
is a problem caused by dsi pm_suspend and resume.

So when we entered the pm runtime idle state, if used with sync,
the problem does not occur.

Best regards,
Hoegeun


</pre>
  <table id=bannersignimg data-cui-lock="true" namo_lock><tr><td><p>&nbsp;</p>
</td></tr></table><table id=confidentialsignimg data-cui-lock="true" namo_lock><tr><td><p><img style="border: 0px solid currentColor; border-image: none; width: 520px; height: 144px; display: inline-block;" unselectable="on" data-cui-image="true" src="cid:cafe_image_0@s-core.co.kr">&nbsp;</p>
</td></tr></table></body>
</html>
<img src='http://ext.samsung.net/mail/ext/v1/external/status/update?userid=hoegeun.kwon&do=bWFpbElEPTIwMTkwNTIyMTAyNDQzZXBjYXMxcDMyMTJlODU3ZTA3NTljZDA2ZmU1MDRkMjU0MmVjNmU5YSZyZWNpcGllbnRBZGRyZXNzPWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc_' border=0 width=0 height=0 style='display:none'>
------tU7OzLh4x2RFN_-4cPX1qtoRf7UObRrEIypeiIlPLbux9tBn=_3798c_
Content-Type: image/gif
Content-Transfer-Encoding: base64
Content-ID: <cafe_image_0@s-core.co.kr>

R0lGODlhCAKQAIQAAAAAAP///8k6OspMTNRiYtt0dOSOjumiovLExPfZ2fvt7f/+/uvr69TU1Lm5
uYyMjG9vb0dHRzMzMyoqKgICAv///wAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACH/C05F
VFNDQVBFMi4wAwEBAAAh+QQBAAAVACwAAAAACAKQAAAI/wAZCBxIsKDBgwgTKlzIsKHDhxAjSpxI
saLFixgzatzIsaPHjxkDiBxJsqTJkyhTqlzJsqXLlzBjypxJs6bNmzhz6tzJs6fPnzYFAh1KtKjR
o0iTKl3KtGnJBVCjSp1KtarVq1ZVCnXKtavXr2DDih1rE6vZs2iramVAtq3bt3Djyp07Mq3du1lT
bg3QwIFfvwwasJUpmK7WBikL41SMkjFLxyIDq+w7uCVkpJJZZo6MWKyDtpdpfl4qFQFWBQnwQk2g
gCpqtXorQ4gwgUKECA0ijI6p23DKBw9S9jYJgffuk8NbJh8JPPEE3I+DL0/anKWDCCSvj6XAtUFw
k9NLFv93yd3oeJFSB2BFUACtgakFTE9lDxvlXpHaRYZXftw3zvIv7TeSgMj1F0B1J+XHUnMEEoWg
SgoGEOFXADL14EsVrpQhUBXaRd9Z6p314VRrlaRgBBBQMAFiDERgW2UBtEgBBdKlOAFbMkbAgAPf
8Xhgbd+J1MBsNKaI3Y80xujiigGkmGSTMxbXAJDj2diZSM05GWSTDQzpYnFGIhmclxSM94BtE3z2
AJBYormbjEzmyFZvayYJ3AOj4TlSbWCqiNgDKY425QQPoOinki+SBMGZcbqY5KIqOlDbZ1OWKaSK
EWwpY5IM8Ildp2Vih+IEYiLKpJYiWZnqoYpGeWCd36X/mCJJwE3qYqxRtijkkUKyKWeTjHY5AaGb
BgdBl0SeByVuEEzQp6VQzgolkyNVqmOpP6bZZIoMwLpsXVG1Z8ABAxCQmgIEDGCAuKkl8N4B6b5n
wAAFuEuAAQakBi+9CowoVYnZ8XrbgWAWrKiU3NHGAAQGMzxlqg8wQIGwVzowcQM0dirYxSsWSvCU
O5JaqEArLtoidmt2SypzD4AsKUm6WbxxlxQ4IDHFMt98s8U2c4xzzcyh3HBxut08pXfAHTlx0N7d
uOaB10bm8MCAbmv1gChjxzBfCYvqNHbEZhpAmhJvuTXGwJ6c9sA1C+Szx4C6LLLTc6tMq44ap4z2
yNJi/+n0xdyNrDGTVe/pAMYLG0y1jg6fnbBfE99cbc0WsyV4x4wHTjfM0kXs881Po+g2xRjvlt4C
BbR3gLgHKJA66qbRN4BpAySQwOwIDKCA6wgoUDvqB/gbFcAjnfiZdktLTJJQFgcgtvJLo60tBd1W
GWR+5elW+KIeCyQpW52Bnyb1Eoo6GrWvgswXzH4d2Vvg1uen/Xhpbg8c/bt1z1b0j9sPnMQhC5jz
zoe0kjDoeNhJXoV6ox3mPe5V5XtYBFe2qOWxpXnk81gGE4gl6+nve+sbzopEeKUY8aV+33kg2lhW
PpGUR3wO2Jq2eoUfyaGNgSgLjgMHKL/jcEdBMOzNDf8JOKAxEQxihZOOmqwXgA5FRT3xWYDsWrM6
2EmxPb9LzQLU86EotmtcwoMK8fAjMAQ2cUYzIom1HtjENroQWA87ExqvpzT98AiNGaNNxKLFoiWN
j4zOw2P+jFWmEsbMfZ8JHB7xhMjqaG+RjnyTHvc3kv5BsnMVLJ757HihA7YQjws04xoHCMHrWAyN
ujnSg0ZZHuQBsjxynFHEJsnHQKLxOoIcCZxQ+MbhVKg52DNVmkBWoQgB6IHaac4oD2lHkvzwSLs0
ZS9z2SuxxZJGD6LTIt2InidaUXZQoU8U6QOvKG7xilCJ4rwIQIDgtYcqY2xhM10pJJLM8IHQw9EP
nVX/nOqUMJgD9GeMAtOsGHmHelsbIPm0M5wSKrNb5LNjD9so0B5GUqCR1CVBSUU+5WnvO38KDqCW
pklSjo1HW4IgDrlpSDPek5TATGVkdqTKLb20lRz8JJZAOtAhkSowZ2qRoExawoR+tJej+WVwgmnU
z/BTgBICYIyQmcOxpZCHiHSmPJvqS6KqsXzcq2d1lAjB9XEzAKcbJxbD2R61LoA1qzvAObuIgNVR
0Z31Ocl95ElKhi51ZS60XML6KSqRHmlYiAGh2ADpxpjdyHmA0iGNDivN0jFMbd1D350oO6D2NXOf
c2KkHR9WOsXiiVSlG0kFPWpYHj42U82RGGAB6bG9/6XUk36V0GxXmsEHxrSJfyrO0gjlTMFCtkmF
Ra4bTbvayYqkfp/CXIzQJ8SaVQd+B1KqPFUItECVhHoAtOYmkxmc3mK1mZWUZ3V51M/ARfdKZLuO
+jL1sJcx8LXlxQ9avenWAsh1XcBbwOoSQIDWjGuu74zPAd6DLrzCMzYmKmMLMeai4zTLWdSjTW0Q
Q2GSuki1w5otQHtzYdSiKWIhxo7FaJMpUM1murRR1v9SzL6JDmthIVbvZ0q84xw3KcS7oTBxO4wY
EufYkSlt4LCA1snJitI2QOtsCy/MLTotFWXPWdqahmW2YXFLyNgZ1HO4WWKuTZLGnYoxjJ2VHTTB
9v+qncoyra78xhU/Z6kb2jLCXFRkM54JUF7OsGdN+tw0HcnOLR7Wh9PMZuac+MfDStWkTFrmsd2I
O2mNXXsIzM725C514iJAAcy1AHbS1XejxlcYFxDPlhzOJF0yUWV2BKOS9AUmt47Mq/FzpVwfyHK8
2nWCSqgVm/HFQNmBka+japIdXYnWsDYQ+oY9GWIXz9qwxna0KxPrbC+vhJux9ZuELWwJ/dPay04Q
ro9TOFs/29iN4bC29QpvIfXn3taGtr2zg21f0zo4aHlNVGxXGvksoF+tmQrCzdJq/8xkTWdCtsNf
4qWJWxwoa5L4xXHSLf8IRDUgD7nIr8IyjZtk5Cj/T7lUFNA6lbs85BvPiV9iTnOdfBwvrLlLzl9u
l52X5uBaDLnPdZ5woSNg6EM3i8Cn4vOlzyfoKXc6wxNTa1xXfSwmhxBQKHV1Wyu76waVSdbDrhcO
g73sLbk5VN5zFnOmxe08b7vBvXkAuYq87iDHe8g/DXe4X+U9q3b7qg3QTpUD/p1oOYl3CC2TC+lE
TytZmIZosiGdBC6lBWJfSibUkspHGEKbfElxOK9XBpxO7nfxe9zzbveQ6x0vr1dN7MM196uEyCqq
p0ruQX57u5zEk2RpEGNT4nmWFP8mxy/JcghEepw0f/gweWbaTb92egm4XHYnF6kLsM7UjKtc5yoA
/7+s2P23ih9froNK+gcer3QSfuDrGoBc7YWvBBQg4flS3fzbf33ut4v/tyNqrfdW6bJ95HJ/b1Uu
/lUa7CRXrjN+32cunLZg+kIvBGAa+zJ/8Scv9OIuByd+8mdFqyEv2pcAJfiACIgvtRN/C2Z918cv
81IvDCZ+KViCwyMnkkIohtIoicIwL5IbO9YthERc0+JQdbJENVMp7bUiStgrSfIlRbgqfVNWOcRl
UlgeqjJSQVYbTJIptqEfZ1JHwGSFxeI8NjInaqIiW9JAjoInreUjA/IqVrgsNMUlfFEcLqY1yAKF
gfRiqmUbksKHjKIp1JeARyeBukNgJkgAqKM67/nxOlWELwsgiQp2f/AyiQbgOu1BagsmFe3UYFvU
O1GRO62jO7mzO/FxYAR2Tnj3if7lO/0yO6XWOgt4gbczgIVXRSFYi0cXglFxgacoiZSoOvdXf/Gh
iLlziL1jirXjO7aDO+LyHqsoeG1FjK7TOsL4iJmYO8/YOhJogLeDAPSRjY0oYIhnNZc1NUKDjkQD
AUJlMZ6TPjfyMiPzMo7WFyJzLcQSNig2S8ExTNSzJt6hI/SYOXP2RinTPHzjXgH0NPbUWmXSIuXl
jmJzeSdVOWdDKgqzNbpxNIhTUo7DUNyRSQg5jwyJIgxlRhxpPjkzMQupRpQTOdTjkRH/NVCn04mT
WHdsJ1f9pWlb1C5QxB52Zy66g06SeIHsx1bnxIBr52CVKGDvoR51hwCMeEU4CYxVyR6rmJMrd3C6
CBV1t5UHthpZ6YwJ+E36BztXWVdsB0YJRjvotDtSFJSj2FY+GUVZRJcfEiJe9IFyxUVYBJRoOTz8
o1JmpEAwlTQyBRwgVGTfoVn0U0D2mJKTiRuPZTO5NTZAyDUHSVFXVV3HpZkXgiMalFgJZJqeKUE2
s0OL1T9MBEg7xB22sZnpdV2ktCMp+UnAdl4D1BvKo1UW9Zo2SXcDUJzyF3s9iU63F5TmFB8hQh+K
2HsfAk6l8U5T+ZalZkVSGTzGSS96/xcfuWOc8WGdA6h9rxMi1wmWrecvyzmYeKdgdqdg3emUcAmd
6SJ+IohOydmebrWU6lQuhQeYS3lO/clqx2SYn4RHfYUiECdShHQstjQjg8RJdNZCMYNHMlVSjiKh
XcVCnolU03RLTfYcOUVPrsSYvHJCUGZSljRHJTVKaeIszaNVtpkcuWmiLIlIHZpeFrVNM3WTdqcv
2TeYblWUvgM75nSBRfkh98J24ZSVa1Wd6klXs1iU2/khu7OWWNov5Ml+qUGd6Slg6/lOy9gaR+pW
71lX8ammq4FO2olOSEmgBidOd0k7ZqqX78SXdYWAeCegRoqnhKlPCEpPIUQpgAiIEP8EVCM0VB56
VJXJm95zaHXYUCzamRbZRl1FqavEJDi6XByEojX0Ur7ZPzxVUi81G5lCG99VVirkWbwFSMzUm5/x
mzzaSKX6o95EYK3hX6tIlUR6l3JVRU95O5ioidVXe7+zgL03l6lhLlQKL2y3nT8JlbcTi7SjL1HZ
GoX3pOkUpX2qrQOoO864gMLqk2m6iuGoq8BDpX5KRXSplMlJrnbppnraiaAooPI6mGIkXoOaXPZ1
PhqZQUnzXDzyKTX5NLblQo5JSlomXKOTTAZbPdlFK6N3qdh1JlAzVUKYHSvDNsZSXh/7oeA1MeaF
IhnbkfhVUuYFcRajLB9KUf0EAbn/5TFi82Kxqj0GCZyINF9BonalVmCEx05rly6mkZzQSS/J2jvs
VHjooi5kuqxzyU6tsaxUyU6Hl06mcYtQIa0H+Dvah5RdW4EN6IlWy4joGawAWp5Wm4DilxpoypO9
E7RIKbduGkWmFmr3UjvU+Ktsm7T0irWo1qQ/e7Rtq6+sRmTZVShPVmEm9WEFBUFopmEyFmIO6jc3
9mN3xGfZgjAU6WVrViEU9mG2yWjc0SKeeyEhVlBo8lirS0nNoWeQliK5sWR9BmkipjWBRjOek1IW
C2MTox0rNjBilqPNJCsZMiwTVWm4qn6imABzJ4ppsXBPB5ZUZJ1OKhXOexVaWXt2/7FwJggVpHZw
0At0VTG+VSF1qxF00osW5pu9VrG+BBdy63sW61u/5vtg+sYX2Ja/LlFu5fYq/7tvxYMj9dZtx8Zr
2UFvK4FvEFIZ1LMbD5wYvUZsyJZuajRvLsG/ZMcZK6EnK6RL9aZG/eGzq4cV8EIuGBind7FqIIcu
61KVJRzDMjzDIBcWjldzq6pVOCwak+WyMUHCNDwVUxlO3IsW3+tyJthyQbzETNzEYTFzO4wStxXF
onHDMLEXmxFuIgxrYIdSQJHFGGwSfxHCO6HFOsEYfTHGZ8fBEPI/PIGbUFzGYdxsYwcuAwd1TfxW
RXcaeMzHVUFwRbx3Kzxyr5F0f/+8O318vomcFXuhIKS3YuAhcbexJj4cFP1kLHzVebehuTsxeim6
E8kxG7VxG3P8fD8CaGvcwbsRvJerF5VMHJncEgLZGFsyFfeSx28Ft2gxe+uBeFLRpy8HtVURPAMK
cnRKFdcLOyysfu8ygAzXyMH2yTsFEx4zXXXcvymafCgBIO2WE9psE9Nhyp9HfJ1BkjNhowKDeVA1
eee8WCbxINg7aricpqu3ary8xLu3wr48FcK8zG56FwNVUrQFK4MyS7LEJT51Hujzat5CJiMVZkSC
K0wCJPczm3joItfihVHzRrBaULAieUqiolKSLMsyJCINholSLVy4h9AShjMk0An/XYZ5iCgb3USD
URi/IiMxmyaSYilb1hkKwiAFpSpsoio6XdJSwicoXdNjoytO2DJzuF/qaQDyEYHOa3d1FRXfKabp
4oAg+F9fNIHcB34EqC7u104HYH+g9oHj17QANnAKyJNlfX8PSGoEZtbA451Sizo5SdYPeJzsZH/V
R2pWfb7xwi53XYwdSHj1V7Uh6IGTeNd1t39m7S7n9y/QXFJ6g1DH4jg8BF7pVRISczgrIjMYg2J9
kTEBuTkCCRylpTUG84Rbws3CtZoyeTRHxI8tSTOexY9N1Dn2pCa6cdtHwzPjXDmJw5kmMzBbk1Cp
Ql+qNTSdwiOPxY9Tskd8VZFq/8LaHbM5lwWQve2Pvx2a+FEcj3VSiOMwdlxqJsh2kFgvfNl6eieV
BUaskkisaqUAxuiIs3iNochyrSOOAEaO42Ksv7iMfxlg/lVFneiKf+mNj5jg742JBEhgpShgBXaJ
E47MtGiXC8iruCOu4Cl/yPiW8JLE/d1O3GiWYpTZA42QOnRBjzMheRY/deRaEENC5NVGyMNhsjnN
lXQbG+ZG9lNB9LUyppRVzyRBGgTk9dQtGTo/BHvc0CTjNp2xiEmxh4KYC1VAqhl6EmIbGsbROh56
K9LlPG6ZWJJTD1JBFaSaG2vHq4guWAunZarVdiet5ySXueOeuswevmqOS6l3iv84rUdalFVElk1J
oPMn6IgMpf6JgRLuk3xOl+9qLgWaHtWLpI2OYFgb6G756fq3lQtGpS1eGY5cVR+6TINWSbMW56Da
WIOWNIK049J3oLA0238R2tckWiaJShP1TPlBTw8iR7dhUd8Rzod2JKz0SgrabFsDSmcFTBhKaJLi
F1eSPaPBTBtaMxki7MtO5Db1HGwWIfAcTvRSuGg6Lr4832K6tXMNqPQM6GTqrUOZ5925lCPyIcBM
YAvoOp8YnsUZpVEEzG6V2JYuguPpk1TxnHbp73let+JInnRFTg5G73V+6iqt2VfVHEQ445+cHJFl
42Q+64pbT7aum1Ml7jqswwL/VTakkh+R+lnl86i5rtKmiezoJdD5cVOvVC3FA1iEihitJJlVbu3S
rO0Em5vrU/RpbvNOPiV/IX1Rde7rigAHdvDqUp4R7+5xKu9/Hh+QfraCDu9t6vB1qZ7n9KXch8iE
t6WR/u6Auq0Jn6SA/s+nR6dsH5US/yGhrsz6F+gYn58BXUmdYU0dX17GFatBjyPDdCMaM2KQgxjS
FflVJX38evOhrcOm5TytGVzB/kkLq/m6pR9R7hcmdm/hfuUYW7P+OltRVjVi86+QdV3BhfQmAUth
Jn3VLGjHdeuj7+Qk+T6jE1uI4U2K3p/it8ed2OfujuhQFKxpWaRum+BiWq3h/yJXvrqAb721zZrg
F8ilB3bo2Br3Bu+T0P+mVYTflA513G+XSAlOFd+MzsqIvjPxcl/9VGoahe83ABFhQgQGAR48CBCA
gkGEECZMgECBQQQHDiIkxBjAYQQKCDU+hMDAYsKFASg6eAiRAYOBEAM0oADhYICHI2FybKAw4UyM
JTP6dPhwJ4WcBgcSHWnSAc0JIx+kLFiSZ8KUDpNS/FgzY4CkSYNGZHBz4EsKHJdidEABKlmzL1My
3Hk0p9WESX8mZDmBwlKYIVtCcCuUqdO1Uj3SLGoQ8FOXDzrOXLDgQIHIkQcoKIBgAQLKkjtXTjCg
QIEBkg9YXmCAAAEDlxGIHv8tecBkzZwlryagYEFp0wcG/B6AIDRpzQlwf769+nRp3wUIHBj+/Dbp
BLsjZzZtHbtt1awvq369QMHq4Au2Uz5wGvRx8wiaS19tuz0C3AYiHxc+wED65LnlYy8tgJW2Eimx
rbZqwMADM2rAAQMbXDAjiyBEKzEKBXSgILwyjLDDAy/8kMMFRdLwpbM85ErBrUREEaMEMwprRRVT
lNHFExlk0cEWK7SxLgtPJLHHHT+0MLHKjkQSyf2SVECzJEGrDsojE4gSyQScfJJJ4SpToMopvYys
Sd3E2zKyK8fMMs0FqDyyzMjcRFIB9bgEk8wxxXzyyjbR1BM0LJM8TcAShyTatNAO7TI0UUUXZbRR
Rx+FNFJJM1IztdwqxTRTTTfltFNPPz0AzU9HzVTOBQSdNFUGDku1VVdfhTVWWRutFDpSb8U1V113
5bVXQXdNQNRec4XzTU2DzRMBYW9FdlhM/8z0z2YrhRZaZzm1Vs1s05zW026tXNZbUZGtVlNrBSyq
wUEVvXHWD9f1MEaMVtqVv2txVW3OAzTjDVPs4hStTm9P+/fafZ/sV9OE7c3y4IStu9fThxvml9OC
MbXvyIsjO3hjUOfM7uHSFMg4zYm5uoiBsmYs1Cd3D5yqRUT/6Y245k0vBvBW+XJlOGKPP51YzZxt
tvnnXoNOEjujOe25sqB3zvLkkRBl1OWXGZ2ZgSN9I6A6zETTbb8BunbvzfQIbk635gzw0jj9rlOt
Mnspc7sA3dwu2UwC3uY6yr71A3vNvfNOLYH09ib47da6lqw1BMQmgL7yvn6OvufYTm3s6g6X7sjW
7Bb8bfOak61rtxlH7wDlIls8ytZa2xrtwDnWHHDQ0fuN8L7FIw10yCXX7Pe9NeuMvwLSNo/1wE83
XHPKvvZ998rYptxL3xQPWDUDMO+77+M7w0xj0s2Lu3XPVucP8IwpI80+8zOHHUmUTYoJr4sEvKgB
vQAzaSdW/2MqS0H0p5YGPOAsBtQIATPygIg4aH91eYhHIjKBnByEIAmBQAMmEkAB7e9+eNGa3gxH
gNS4zz7OKWFornO23aAtNE0qT2WeM57lKEtu6inN8Ua3gBnqUIah6mGownQ8Bcxmh0HUmHv8Q0LV
Gc5uqvOMbmLjHDlRZntrKs32EpAZ1cmJif5ZmN0KYJ8ZSseIx9siEE8zGet0MTyTaRIT7RY/ji0H
bVwi4hmXs5tgMU6EULziFaeYGzYOsooQS98dmSNGMq5RjKHKognNgx7kcBE9eRtAH6kUnNcoADPC
6VoXiZgZxh0AkwbATA2r6MXbxDFkqNQhc0JpN/pEkY6Vmf/fUxJDQcXQ5AEsQYhhfoKQCCBkAgh5
QDH5R8GniGQCC7zgMSdizIpIJJnOZIhM3KIRwECgm4CJwAd/xbGMLac6KvRhaSJXRDntsTcZi9x6
3kSZh9krh6c5Jwk38xnjzLM9SUQkdPQJNS7icJ875KHh1IMd/tjGk5thDsEep57I2ROgTernQXlj
vOKIh40RRY0Pu4YdFd4woADd6B4zuaatlZOPWPxnQ9mnGZmeNKXa0UyTxOPRmVpnpeisTSXd8zxR
/RQ1/3GPS5X2ODL+aaW24Y1I3WPQ9FUHqgcV6RaLI7WLIMqbNKnIM+cnzJ74T0ACuuZCUKIRj/DS
rGtFmf7/6mKSthbQgBdhoEJyojKFFCSZMAphdpw22H8xZz+pC+jcsCSfq8YONcaRzmuA8xnG9rQy
Q0uPZH8jVIva5l8FvQ5NT2ObuoE0M5+dKmouu9jONJajt4FNGw1KGuBwxkkLc2fPMLtH1V2sZ/3K
oWixKlzX5naPvh3bFCsG3H8SVFnOEaLcCFDYg7ZHt8QDZUkHq9HQhtai6fNnaTwLnOBQV35TE6f+
YDK/sZq1rHBxzEAuwkxwUsC+e8HITNJyX4qIkyP3dcBB+IqV+9pXJ+wFoUklsxvdFPGf1gnNksD7
zvssdqD0RJJFrTpG+Tz0TRd+cHdT2mFRgdY6nnVSRRdK/1zKxFO27fmXilXb3SvVkrvZyUwRN/xi
nJrpwbg96WptuqYq6ks9y2lwcLOD4iVjOGR17PGVjLPjnF1GPEp2ricTEDfQFPnEnTGxRP/JGsLx
prExTu2LzYxhJrPUvEeaH9UgAhi4joSsJPGfeufnzaYoJSEG0u/9VtKViZylgsR0TFRcdOCsybOW
OiykfdjIw5um9IWvcWp1Yplh+4QnnlDdHCY1LWYhVzrUSewsJWGq2CYzWDY4HuqqDSo3SdtnpZuG
tY1jA9I2Pu8ypny1SW9aaihn8lJL0ttmSAjpntaUoaOl56iHDGxT6rqn9/RMc4W6JAfrLWx7RGo/
H43dzP9By4hL2ijdeA1SPX452+yk9siqFGdxJvAsRKGrXvP93oPANZyB2UnKJJJfj+A7rxJRWQEF
vipkjiXfay2mRsRJM9YND4vUMQ9u/FY845bOxW8a26UeNhzSyMY5NBXNSivzmtVI8U/guWlzVO5d
gzoUN2tccau705rm0WY86Jt1mKb71JDr5qbgcQ5rSLhu3q3GPuNxDpCHXfHwPFk1zvGSasoznFuz
OKbQttR0Oz6yoVenPiSE+cW7Xt3QRgdkV2dcfMAcPIsjvTYTE03LIfZz6Xx3OdMVORZh6XTxAF68
n6H3inzCmAkUJCgR57cxQSLWstgPJAv0iGNwYhSXTOT/8jOBiUdugl/9PWTigX0TmvA0HzQhO0uG
uw+Y+pQlnXLJhmG6/ZS29SaBrR5bAuNW27xUrCf5fvZP2hLxkT/8Tyn/TdnKve+9Bfwj+T73m6mS
9NWE0SQhAEvaT/3KqwRsJLkmS86vvrX6BKdtoSivQvozy1YELwnJH0MlehGP4sUieQH2Zi+/lDQp
IgNAIaIxwANEwARUwAVkQNWxFqRhQA95ina5mgr0P02JLo6hPi5Jj3BhwA8EwRAUwRE0QO97EpAR
QQ+pCAtkwQMZEAIxkP5rwRUhFBlsEQ2aQQqcFXkBkRGxv0exwQgJwklZiiFskSEcQh0klPzDix+8
GiP0/8FCUcJFiREcHBIo7JAXxCAE48IZfC8UobN6QxGsaEGrkZUw5IrKixA0hBWqiRA3nJSFiBlC
mUP32gozFBD+EcLFYJU6zEExdEE+bBkivAgy3Ao9lBBARBEt1Ak49EJFwcNHbJFIfBWX8cOycsRI
ycREnJVLdD9WIbgFwcNNdApQlMRE2cSX2cRRVMR4KZGIoIijAIwGWIwHWiCtGCD+KaayYIyC2MVi
eghfNKtfFMYN4p+nCCBYpEX84SCZUCCMyCBa5AhENIqOeAmH8CawyMVrdImt+EU8SyC3ioj6GaAL
QkZWkcb6qcaGWJkMiiCPCDBoLAuUmMa4sMZ54Qhe2v+gC3JGffQgt1DHCHAItHgIa7wgkyiRfXS8
+EIJ0tMLXsIrdHzInCBGshgIdFSLiNvGA5ugnNALdnQrqngMgbDGmRhHVjFGe0SIdGSgymNJWLxG
DEoQCKjHZRwgCbIvwPhI0LPFisSIi+jHhlyKoNSLIuSIC2KJmADKCrIvgoDJc0SZeOQKU3RB/NuL
tMgJpLgI/MI3vCCKp/ClaVKIX3KJiOsIlgCnYDIrg1RLb2KJDMG3YoKJigDKbzIJvPKvatKgrhQQ
olCvtPDFkAjLYwJMeIkJsZTDxgPLa2KJBoi4Yko4PasLokg4lXGgBLlKp8ygkoA8stBLvYrMkPyr
vPr/qq/6t7+SiYmYr18yyxzpCPXSJrmCRrv8N4FYlflair+SQ1bpM91ENLBSGd6ES2NiTbVspsVk
JsUUq7gIsMZbq4PQH2yazbe0zL/0y7OkIKwMvca8Cr1MuJFoCpi4zZVITrsKS7P8zbKqTcUsxEJk
T26Cz9SsTbj0xQeYy9BskAhYr31zxbvoTjvLCUA7RtnUzYTAipngzNxUS7gQpoUYOB0JULMcqwBd
CKxAlJO4H0N8P5nozm1SDEfENzvzM8Q4K/2xiJXsJbZCiwwNMP7RJrWKSOAcOExk0Q09jL8aEHwb
sKWwM7/ST7ESUQkRKw59pq/qib2qUAWdn70q0Jhh/9KtzLMhPQzZlAnZFFEyzM5CPIuQLEU8g87G
e4mfKAgHsdGkSFAzNVC6TNP//NG6KAgBaopSJFAohQv1VNKROFCEANC+7CuD0NISldAyxU2VoT8C
GRQYXVO8GogbmYquoNM8PTBIbdC1PDB5jKBGpFOdsNC87NChuK+7SlP2sggQrQso/S/7ypB8DM+L
NIgCO4zu5AkEzSVkkol6Q1SlcIxPxUdpUogC87MgHdUCy9RSXUvJJAlfhVSnaEoojZlc/TfDSIpG
vZ9+E1ZNLTA1PVX8Ilae2M0EyqC7CEWGQFOlGFcMTdREnRlVVdN+u58gjZkkhQs8vdOt9NWSkNdw
PP8mnchV+wJVBvqrIzxU9jJXDUqmG828OntUJU1QBqVUhrVXhfMrtexRPt3UjDDXEa3TnOhQhCXV
9iLDudBFHbEImRA9TsRVF5XYGO0LULxViuCJGAyLgfQJiuRROh1VQVM0k9UmPrvDRUvWH9VYZp1S
XnJXUK1T9mJXENJUQ5ufj+VEboULgp1RRisglC1XNY1UrL1YDCU0IzXXfgNSOn1XPws0stXTTM1K
YnVZczTOkrWJmKDKqvRPFp0QMNWmP3umtYrLBZXUUEVQilxQWcWKYsorYMLUfPuriv1JrT0RlKjP
Tt3bpLBCkmgI47wfosCKuWwKkfjR+lzRNI3Oxjz/XJ7Qi3VpWQfyXAxCiAHT02eq2IijSX07OMXT
IKJVx59sXbONSrF61qP1N7ENJo/8H+GVXcCQw5TJUj/toMToUn21IKo4kcG1z8bjzss916xdK8tk
075KuMzNTAYF3AMb25/VXTzNXdjV0sLNV7UC02K6igddxEGpCboFypYwEIfAL8bL2b7V3ccLXLUs
vWdSGYH4qvlli7isWYtl3IwIirxl0bgIxk4liZZQNJYg4DQUCMJtiYZ4i8/1s68oCAOOVTE04A/u
4D8ri3wdvaWo2ABW1M2zGpQACQ3hSxRuC/KtimfqVozIYfFtuEvNr5RoOBjuoAvuCwvuRhQmWS8l
ukvTY5AOBuGrvVqmEAjGJQyXSIsM/iW4/WEwvbOljdc/LdsVDoyxoAj9IWCdbLwGRlrr7c95YZED
WUE5/pFGYcIOuZAg2ZCEjONF6cEQoWMx1UEd+bMbURf485A87mMVJZBFDgsKLJD6y8IHWWQGsZDl
rBEUIWQVtL87dhFKhpdNppBNRuRARhBDnsIdqWQEqWNE/mNJieQmdEH+45A/vluAPcVc7sSe1WVo
BNNeVuXOBOZhJuZiVhSHKP9UuTXmZYaUuH1E+2TmCCmgaKbmal5maL7CZLbmbebmbvbmbwZnYmbE
cCbncjbnc0bndH5jdWbndnbnd4ZnLxzneKbnerbne8ZnZc7nfebnfvZnb57nfxbogSbognaXgDbo
hFbohWbo+G3oh4boiFboeZaAjKjoDrloD6nojJaAjrborejokM5oFOFokcaIixZpjw6AkV4Qlj7p
jz5plU4IlDbpmbbolMZomS7pkXZpnLZpjCbpA+npmA7pl17pml7pmTZplAZpo05qjQZppHbpo+Zp
ooZpoKZqnV4UpG7pp77pmt7pq3Zqjv5qn1ZqriaUoh5rmfbqCJlqVGlqozb/655W643+aa+u6rgm
6qXW65+e6rdWare+arL267F26sM27LYWaqi+a7VubKkW6pRma8Wma8fG67tu7LXGaZYmbMXGa7BO
7Msu7Mxe7L7WaLIG7NEWbL3u7NX27L+W7NSW7a8Wa8AqbcwmbZhmaqbO7dd2bco+a942bd1e7M42
7tzmabNmbZuObdyO6roO7eMebs4O7tvO66x+bp1m6+tGbuuW672W7qcO79r+bMkebbvuavHOaujO
buWO7eRG67jeadBubtG2b0Nt6rAO7e9OauFu7fUGbO5Gb7/2adi+6Y8Ob8I27skOatUecKpObweP
7vh+bwSvbQHn7+i+beDu/+3HZm/7lu7xBm/LVm/+fnALz2z4HuzDTm1DEW7mpu0In++3ZkQF9275
Lmr9du4huW4R524ez/AQT+z3ZnAIl/Ad5/AE3+8dGW+a1mrepu4Ob2vOhuzI7vHtBm+5rvLpFmsF
z/Hfxm4pT3AiB/D4Vm0Qt2oNR3ItpO4od24o9+xHGfAXL3EWd/H8jnECd+wWB3I0j+rSVnIpZ2wT
H+rLpvO5xnMkH24wX25Bb/AuX3H1rmy+9vOy/u8f5/H6FnIPr3T8LhRMh/MZ33MyT/Q4b+kKb2/l
XnTyHuz6tnSP1nFTB3Q1X+9UN/NHnPOc5nNFGXPztnJV5+pQ73MjV/TT9v/1Mm/xyibu7g5uGl+X
Y8ftQt/tQU/rDG/2ZH90ao/wbd/wvp5tbQ/0++72EU/1Xy9yAG/0Xdd1yy70Th/3VY/2wlb3b+dy
bYf3Yr/xSnd28qbpcafvEcfybO9vfkdsJn93Vi/4Vz/3KU/407byVt9ze/ftNyf4egdu2FZ1ir92
7Y74jcd2rD5wGD94fAd4+J5rV2d0VCf2KQ94fZ54Ri/uhpf5bG93da94kOf2e9/w/25wPv94mK/5
nff3kVf0E7/5dnftXSfyjSb1Ukd4ktf4Yld6Ukd6ojd1BtCNVxd4kFd5ZDd4rS/5re96lSd7lB/0
ro/pkIf5pzd1aEf3cj879Vvnd46Pe3Y3e+u++1bB+JN3e49XeFFf+HWXe1lf86yX6MNH/MSPZ6w/
FcV3/MeHfIA2/Min/Mq3/Fz/ZvzL1/zN53xZyfzOB/3QF/1E+Xxfd3KtjnTx3vKYbxF6/3QSz/ll
h3Sc5/odEYDbFwCMuH3dx33e95DdDwDc7/3gz33bL37i533gR/4OUf6MaP4DEf7od/7oP/5EEX7f
P2u2j/suz/h7Z/fYJ/oA9/e8l3mjF5DJl/2XJnER7+/tRu3nhvDT5/mqX3fEpnSkj/VJh/WZTwjg
BwgBAgcGCCCw4EGDAhAuVMjwocOIBSdSnJgwYsKMDQcSlMiQY0WLDUNCFElSIceOJy+SlDBRAsyY
MCu6LFgzwM2bL0/i1Elzp82QMyn6DNozJtCWMpH+bGo0ac+dRQMwULCAqNGi/zlpLmW6NGnNsDid
biUr9KzNrmKB+tS5FitbsGjhjuUJUePdlHn3YhxpVyJelCpNAmY5uOTKlH5JHryouPFCtU9bmp3c
lefbynXjQuXsdG7nzVDbcnY5tepVqWxldi5bt+3Q10FJP9UaWi1tt3BpZ/2Zk+lm22QlU9QIsi/f
wMoXJzbeMXDxjcz/flRM3S7kiscFn5zaWu71l26FBxdPNLNnukKJn7/8vffY01bVH4XNu+xU/Ejv
rwZOfjRduokmGmvgveXabeGJ5NhI2zm33HEs8RRhgypJiJxgjylYnYaJebSceAJ2t56AuMW24VH0
jYhWftd552JasYW1H0moxf/IGnqT1adfgfjNplmBXIkI4Gj+fXagb7Xd9tWLCl4YXXLToYjXk4RZ
+WSVGVqHopbPSQeRa8CVR12TXP41I24Dwifkmd2Z+KOBcFZkI2Y3DlUmimuZBqSOfabZHp68yQaj
kiu+9qaZHmLYZZaIbRcegwtuOeVjUkKpnYUNhTkXnkJ+Bah7iX6WXmh2fkpZknHGV+N8dbqq4nhB
DrpngKSKCRquhlqmY6ibGtoppnpZGSViITU6YYWYXlqssoxNqih2lv6aoJrgvYqqXQgKZx+vJ4rK
q7V6VssAAyqaS+Kp/8k44H4zoelVtvGC6q6nd8IaIn2IVmvsYgx2uKW/k2L/KW2l0vVbYYfNXlkp
dRcWjC+18hLIHravxvqpe+/aq2an2jY1nmoVLaBAuaWaPOqY565KpsSm4qhvrrvde63F10kY6bLO
Dsuvzsgq3LNH0Sp8rKT/HiyvibbtiSChdS4dccUsxjw1zVgVNXLJLv8Waoin7hho01F/qyvNXIuN
7Z/BPvqwzxxS2JzADLfNqJQJ050o22SzXGjaZ4erdctU9w141ShjPTbiiSu+OOONO/445JFLPjnl
lVve+OGXa7455517/jnooYs+OuSZk3466qmrvjrrrbuOOcmvyz477bXbfjvuKJqeO++9+/478MEj
vvuZJ5qGcb0nt+lyoSr7/80mqcFRfHeXQTv+6F9VYl+ds3Y/RPT30jZ89NxOil++3Q5+Of7bbted
qZYlqc+v983uPniqKLPrZ9dQS292u9a1vDHhjz43W1/OEpY3t3GHOwVDGPf0sj0PaShLkMmO+xq1
wMLQL27mW9jPeGa97K3vgCKEDgPL17YHFoR4g/qaWFrEInh9TGYfM9KomLavWq0JLNMzofVwtrOc
LQyDQqTSQtaWxMM0yzAEseASMWgSogERhE1kDvjklywoMQyFNhNWFQnzLOR08XxBw5kL0UMrwilt
N8QpUf7+57WUdU1WKdMYDqNltA6e0WBj1GIVcZYdJTaQggeTIs9AYkIqylrNipdyWCOH5pf6XZGS
WizawPhySRUCzYpp3FXzCMQnjoFSRDqUGLBI5DyteUtoktqZF5HlvSN+KX1/JCImLcVCLppxiJt8
ZC/ntshDbpFSuGRfMS8YMFjucpP/I2sVDJEEymnChzxBYlqOsjW91lVwkh784isLSSFFRnGL23tg
LZfoM3LmEop5G6c3LUnCB7EQQsE8TBZJiJIranJD7aMKNGFlvGimMpqBQ1XSyJbQebkLUX1DJyfh
JqzoOKeSJVTn/ArpT4zqspwjzOc8EdhJukEylopC4gYNmdJvgYhL/6ST/jaUnzn26XmlApvi/lM4
Zo0UnHDjHi/DJ9R/TrB6e4GiA6cDvnem05VmQiJFM2rSD+JNbmxraVQnCtWCwFSgGQsb/xi6P7CK
rWPb1Mo2hwjSiJLxiX6M6oIiGE+lHi1SXuzmSJcq0qIyi5FwLdYy+/lF8o0vhMvK/ygRUbgdOi10
W2Q9XgHBRVaCZpNqM4MUFjuKzpX+la/aY6JGmZlIkY42g271KbRMO9XCApZgpNWnEzFrWF+qlbBA
66o2M5ZWs8m0XreqKZnOelZ02RGXnG1cPjXYUYkqd4Q9fS50eRrSiTrVqCuMZFw/Ytru3VK6fcWu
wnArvPGSt7zmPW/qxIve9bK3ve5974bUC9/50re+9vWdfO+r3/3yt7+ey69/AyzgAROYSzBF3k6V
5z/KbM15aGVSHW/1xrIiuI6toSkPx1qbgY7IO2tsj4OJW9xVKoW3KhuS1SAG3CWlVXnA0piLB/i5
A0uNU9d0kXDtJc3/nTjDJhNUWv9i9iKv6TTDgtoxyODUI1Ly7cYJNmWLV4xi9UBWxy0TU5OG7MY8
/q0yMtyRgitHrpl9+csHdezKfOWritEopu+qobm0TE0pX9PKa1KznHpjTRXTMY5UPqhUzCznGImy
yjS8o9N0tedRpuu3fV7x5cZs4Rf6OMwGhTOt8BzKFG/YxB/+zWy2dugj+RaVAPJR88SVGyY/GrLT
Ak2WlXIeUjPYWit7NZjRxmZO8bqH0Xv0DiOdNSKV2abPe3ODPaNDGX34ZGvu8U1vJKp0qWrNyPZU
tbBspyVxhdZ6C8+UCRhoehG6yxyDjbdtvW1fj1rdkLacpGFIaXenCNyuimHTTpn/W4qtmrLpjkpM
EUeaZPMtz1spaLbNtMZFM9RIy9Z1yMJEbmCzDJuXFTWCi63KGQ8b0KcMFMxmJcclb5pwY3txZDET
8oYDutqizHOEN8Znyh48YgiXE8IX/kJr2zFpNZdsWCmuv4+LLt5M5la3bn5vmMNZ6EPP07z2Vupv
TzbG1aRjs5duWY2jWcQCnDcby4Nkc58N1UA3d9fLza5Wcs7of/qqqXwdcEDhnD3a9nqR566uxyq0
xNROcJCV7Gc2XibWOWS1gtQYbE7LhuATC7f/Ml3kv18a7l+Tu7Ava+zKvrvDlo5zxQddVhIjPl82
Nby9PZzw3gJ+y1EOcdWzvkrUQMvYspUOdpk4Tzm3vz73ODYx2nrv9zrPGu9RZ7mIr+VhuzMf+Fb3
LdufX/tE0b7lkPZ966WPSuFbP/MF/j74wy9cfq52fPzmPz/622v09LO//e7n3frfL//50/908a8/
/vOvf8ndf//+/z8Aogi5DCABFqABHiACJqACLiADNqADPiAERqAETiAFVqAFXiAGZqAGbiAHdqAH
fqAGBgQAOw==


------tU7OzLh4x2RFN_-4cPX1qtoRf7UObRrEIypeiIlPLbux9tBn=_3798c_--

--------------BB2D361B65F6BE0F10EE23B9--

--===============0294233028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0294233028==--
