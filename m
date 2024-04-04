Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E32898D8E
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 19:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E491133AC;
	Thu,  4 Apr 2024 17:57:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="Xqdb5k+6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2744F1133AC
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 17:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1712253418; x=1712858218; i=deller@gmx.de;
 bh=KT9Wk3EOVaD8qFBZqzR551rSyPuA9sIvLKDESaxy+94=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
 In-Reply-To;
 b=Xqdb5k+6WjW0/w0d77ryY6IBFlrgFKcc3UwovYsqacC2VH7aKZxXiSJULzkQAoui
 I7i9+4HjdQvcm/LwAeHnKfd/XCTC0z1wWxBUpuJzCzN3Vq/bOjViHP57+63Qg9+Gb
 e1ENLNHK7aJDfrtr2+x6U7f/7KyCXckh3YnNwB0vxAr7dxBzcDRp/fJo9H2oygb50
 BJ4SPlPZNW3zI29+nCFFruowRta2S/5nX6xCsfptNSt9dWTXMR5PL7e6Ec9GCw33E
 8n1VlzvoqZplKV3woRPSF7zw+a56CM/S7IxMw8IkWNHvGrRmhG1eaTCwzstnLnmzi
 /ZcnrA7z/ZpNd7WkQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.198.194] ([109.43.113.118]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MTRR0-1sFQko0ZBs-00Tp00; Thu, 04
 Apr 2024 19:56:58 +0200
Message-ID: <dcd279e4-9463-4dfb-8aa7-9b9b3111232a@gmx.de>
Date: Thu, 4 Apr 2024 19:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: video: logo: Don't mention the full path of the
 input in output
To: Lucas Stach <l.stach@pengutronix.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
References: <20240404121824.3330254-1-l.stach@pengutronix.de>
 <c3108939-9e6f-489d-9954-82bd6c2dd3b0@gmx.de>
 <6ae0c57c2176364c8001397d647f9d9fb792fba7.camel@pengutronix.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <6ae0c57c2176364c8001397d647f9d9fb792fba7.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:mEIjn9BijN3Kt81vPFBS8VM/Ui/4WzBOS2SaplVdlVZ7VjQ8T9U
 ZPv9nQqavfG9CuZGE2+CD5xo3kfSFocZqigfe8s8cN/2aC8uLfatknqDe6QxvYNKmXl+hBu
 L97Bx36v3cGnPt+0Oxb0O3EjOWDYjd3kRqkglJ4hTJpILUK8W6IhotnDXCLGfHEs1hL+HMh
 j6fSn+eAMbjBupOfYG7aA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y9+o3O/Q7FM=;gR18ZHesquLHv5bFeIdiBsEzR+G
 gFmYFcetbBp5gq8fc9OzAcxHdqzVPAKKJM1pV9hkDrBfP0h2GdF+9qVnxkmY5bqYhawVJk0Ki
 cxTuNnkvJm6JICxoICwNzWwy//3nkhUXPgOIHBpQP0sRq2YDQUMrC+Y4y/qHlhv5K7KQ67Uqb
 eOtCXeT0VIDPx+s08G67t15s2BumDJsxIpVwEFvZ5oOBdfN2W+Mv1+pztNi/rO/dfJyoJZl5F
 4fynz0dCirbaI8M+Ck6Bb4Sc5lsRWy3YDcGy6xUQEEIKwl03akvRg3b0Rbt20eer/M8E1H3H7
 IuJSWSMksexUsmqgNs9pjHu9ZsLZWE5/Ugs+/Kc6Ixi84e88P8ib5wl3iQud7qWpPRiEtwPi7
 PAb1sBWcWkBnHO5W+dAVid6vBBXS4Rn1mhcMmHMMuL4DNsE+Ig6zAcT8v3SS2BaP1FOLzIpSF
 NuwyrGIRue05HPkTgG1re7aZFH4aj+QLoBCFmLnTc5R3+JqmZNou35WbHF975lPwNp9hMN05n
 n8KHIx9OtFaJ7ECynpBEPyh65yIJsmdOR9oJnoZyPULBQXIuTiQwQBO2pCjJdpewqFsVCBaSK
 yOCTCpAHDMb4iBTjQp0GYjus5h9po5WbhwkGGswCIyYvTH67EuQ72dYMn7WGS5fZSdKFfYQdB
 DiacKxcdaY5NKQ1ZwnULTzqFaVeGyU/njMf1MtHYWzEVKXp6+Ebz6Wt2NNqOovjqevdaONTkw
 Z8VP8+KjkHH/Vykpzjc4tJC9dHmkahhwYIwF0nkJMe/hCjExCnzOLKLEET719hO/J0isbZdjv
 Iug+IW8ZKWVOwL1rJVj18LjAf3Aj4Ei2ACNsFvBcCPtz4=
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

On 4/4/24 18:44, Lucas Stach wrote:
> Am Donnerstag, dem 04.04.2024 um 15:15 +0200 schrieb Helge Deller:
>> On 4/4/24 14:18, Lucas Stach wrote:
>>> This change strips $abs_srctree of the input file containing the
>>> PNM data in the generated output. The motivation for this change
>>> is Yocto emitting a build warning
>>>
>>>       WARNING: linux-foo-6.8-r0 do_package_qa: QA Issue:
>>>       File /usr/src/debug/linux-foo/6.8-r0/drivers/video/logo/logo_linux_clut224.c
>>>       in package linux-foo-src contains reference to TMPDIR
>>>
>>> So this change brings us one step closer to make the build result
>>> reproducible independent of the build path.
>>>
>>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>>> ---
>>>    drivers/video/logo/pnmtologo.c | 14 +++++++++++++-
>>>    1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
>>> index 2434a25afb64..59ccd721e8af 100644
>>> --- a/drivers/video/logo/pnmtologo.c
>>> +++ b/drivers/video/logo/pnmtologo.c
>>> @@ -223,6 +223,18 @@ static inline int is_equal(struct color c1, struct color c2)
>>>
>>>    static void write_header(void)
>>>    {
>>> +	const char *abs_srctree = getenv("abs_srctree");
>>> +	const char *rel_filename;
>>> +
>>> +	if (abs_srctree &&
>>> +	    !strncmp(abs_srctree, filename, strlen(abs_srctree))) {
>>> +		rel_filename = filename + strlen(abs_srctree);
>>> +		while (*rel_filename == '/')
>>> +			++rel_filename;
>>> +	} else {
>>> +		rel_filename = filename;
>>> +	}
>>> +
>>>    	/* open logo file */
>>>    	if (outputname) {
>>>    		out = fopen(outputname, "w");
>>> @@ -235,7 +247,7 @@ static void write_header(void)
>>>    	fputs("/*\n", out);
>>>    	fputs(" *  DO NOT EDIT THIS FILE!\n", out);
>>>    	fputs(" *\n", out);
>>> -	fprintf(out, " *  It was automatically generated from %s\n", filename);
>>> +	fprintf(out, " *  It was automatically generated from %s\n", rel_filename);
>>
>> can't you use instead: ?
>>> +	fprintf(out, " *  It was automatically generated from %s\n", basename(filename));
>>
> The difference to basename is that this keeps the path in the source
> tree intact, e.g. it shortens the absolute path to
> "drivers/video/logo/logo_linux_clut224.c", so the comment in the
> generated file still has a full reference to the file location in the
> source tree. It only strips out the part of the path that is host
> dependent.

That's true, but
a) it's just a comment which is generated, and
b) all source and generated logo files are in the [src|build]/drivers/video/logo/ directory anyway, and
c) the file name already suggests where it is generated from.

So, IMHO basically we could simply drop the whole comment line alltogether as well.

Helge
