Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94DE7F73FF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CAD910E1DA;
	Fri, 24 Nov 2023 12:42:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D47810E1DA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 12:42:41 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20231124124239euoutp02f06f46c9109e275ca812635c7c8f51ab~aj6epTX3y2351223512euoutp02T
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 12:42:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20231124124239euoutp02f06f46c9109e275ca812635c7c8f51ab~aj6epTX3y2351223512euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1700829759;
 bh=sXo+i7+AaSd5YnWAyJ+4mnpZqW8VNw+rRiUR5UZTSdk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=aOTaHclPTuCyQTrZ/6IYsi6zqGoPho3hyDY6Cokswk3uEJX3xK4CkzchTzk172Zou
 wxZx886ppdAPbFluneDtQpKfUoaWI7AdFbAUziLKJO5u0xMi0HZ09Q5aFmwOx1o4Pd
 3BS622KDXKyK4tCQXgd12P2bpgDuA7b9giDQm8Gc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20231124124239eucas1p297e355dcbd92e69225b91f5839e221d9~aj6eWY3uS1398513985eucas1p2g;
 Fri, 24 Nov 2023 12:42:39 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 88.FA.09552.F3A90656; Fri, 24
 Nov 2023 12:42:39 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20231124124238eucas1p12bbd91d96c9fc9f7c7a784449e32e547~aj6d5gFjl0104101041eucas1p1B;
 Fri, 24 Nov 2023 12:42:38 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20231124124238eusmtrp227e3bfbb72f951d9a477945a43cfb689~aj6dqbKIf1501115011eusmtrp2O;
 Fri, 24 Nov 2023 12:42:38 +0000 (GMT)
X-AuditID: cbfec7f5-83dff70000002550-bc-65609a3f9317
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id DB.C4.09146.E3A90656; Fri, 24
 Nov 2023 12:42:38 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20231124124237eusmtip14b8a559b35438294d8ed1769a46aea86~aj6dCI_df3065330653eusmtip1e;
 Fri, 24 Nov 2023 12:42:37 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------v9Ek02MQmsoyOM0vpi0WeeQM"
Message-ID: <c11a6d35-0d1c-4ceb-a1e2-6e8196e5f34c@samsung.com>
Date: Fri, 24 Nov 2023 13:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7djPc7r2sxJSDf7PZbW4tFLC4vSZU0wW
 V76+Z7PYfK6H1WLv663sFpd3zWGzmHF+H5NFW+cyVovGI0DZLW8mslrMaLvM6sDtsWbeGkaP
 2Q0XWTx23F3C6LFpVSebx51re9g87ncfZ/LYfLra4/MmuQCOKC6blNSczLLUIn27BK6M5Qf5
 Cw6sZqr48vQKSwPjj1lMXYycHBICJhJvFrxh7mLk4hASWMEo8fjbT3YI5wujxO/WvywQzmdG
 ifMrdsO1XJg5DSqxnFFix8VDjBDOR0aJhmcnWECqmAXCJPq3bAHr4BWwk1g+4TSYzSKgKjHt
 4BkWiLigxMmZT8BsUQF5ifu3ZrCD2MIC0RLHZ1xjgpgjLnHryXwmkAUiApsZJWbe2gS2mlmg
 g0li069lzCBVbAKGEl1vu9hAbE6gbWcal4KdJCGwmFNi27NrLBCHu0gsWXMdyhaWeHV8CzuE
 LSPxfyfECgmBdkaJBb/vQzkTgB56fosRospa4s65X2wQtqNEd2MXUDcHkM0nceOtIMStfBKT
 tk1nhgjzSnS0CUFUq0nMOr4ObtfBC5eYIWwPiVPve1gmMCrOQgqxWUghMwspBCBseYnmrbOZ
 ZwFtYBbQlFi/Sx8inClxYvpnqHINidY5c9lRlUOM+XB4NtQYRYkp3Q+hatQlTu1ZwryAkXsV
 o3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYOI9/e/41x2MK1591DvEyMTBeIhRgoNZSYQ3
 9098qhBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe1RT5VCGB9MSS1OzU1ILUIpgsEwenVANTl4Tt
 jBXM/c+WONlNXKHIuutCw/uEcNHVrtP+z9qloTz34OEkq1/mb2reL/pgtvrvkSMzd35aVnbK
 5Z/Z7Cv3Vuz55ZVcG/DbfPWrBc+3STL94W6wXffFRL6TKZ83yM4oqqbZv9yNIfpkTYHgwUcy
 KQ7cspeW/o7tFpm4/2HLoqRFt/rvFPqZp384y3dNQ1iv+9GeKtmFG+RT11UlTjpouUp74Y5o
 J7nzdV0WWuvTI9ze3pNbcJfJ3FTz4KG5Z+y+PVtZs2vP/3Q9dn4b7bTZLj4he6/Ki4nuuj3n
 ivuhS7kSSpVZOTcZItbv5Vd/NC9MSPLqDL+wVzqxf2O6nm6b49Re+9f50ivT5AbBkCtzlViK
 MxINtZiLihMBYJ/p0ysEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRmVeSWpSXmKPExsVy+t/xu7p2sxJSDS6uELO4tFLC4vSZU0wW
 V76+Z7PYfK6H1WLv663sFpd3zWGzmHF+H5NFW+cyVovGI0DZLW8mslrMaLvM6sDtsWbeGkaP
 2Q0XWTx23F3C6LFpVSebx51re9g87ncfZ/LYfLra4/MmuQCOKD2bovzSklSFjPziElulaEML
 Iz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M+0dOshVMMag4cmQ7SwPjMrUuRk4O
 CQETiQszp7F0MXJxCAksZZT4dfkEM0RCRuLktAZWCFtY4s+1LjaIoveMErdebgdLMAuESey8
 sQLM5hWwk1g+4TQTiM0ioCox7eAZFoi4oMTJmU/AbFEBeYn7t2awg9jCAtESx2dcY4KYIy5x
 68l8JpAFIgKbGSXOPfwE5jALdDBJnP08mRlidSuLRNO2DWwgLWwChhJdb7vAbE6g1WcalzJO
 YBScheSqWUi2z0KyBcI2k+ja2sUIYctLNG+dzQxhq0nc3naVHVl8ASP7KkaR1NLi3PTcYkO9
 4sTc4tK8dL3k/NxNjMBo33bs5+YdjPNefdQ7xMjEwXiIUYKDWUmEN/dPfKoQb0piZVVqUX58
 UWlOavEhRlNg0ExklhJNzgemm7ySeEMzA1NDEzNLA1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQi
 mD4mDk6pBqY23aLbe6cpPrsZt40pXCJrtweTQqnPm+umd8w8an1nPf6kJzilRmjfzZUSDyyl
 rp35zqSlcneV+/O9HXVfn584uLpKUuXY76wzTpcyPkw6fZ+N+6lI7GPrKww2NsnvPfmLXEPk
 99Y/eed8YrdhsLvS7C06i67VTuT+nuTilPv9bOqda3UmdYEupQl7gq1/rXmZuXeii+od5USL
 xVf6vSYL+iyxftWq/bvv0VaLbs2Vrw/cs018OuFOVY6BWu/1O1YzpzfMki5PrhKeZ819rNPr
 ZMvcPVXxIm0Har45Rr75J3xwQra69mTp4mKxOv7vTx9t2f7NgNX5Uvv668ZlrDFxersPNa58
 4zuhbz7rW28lluKMREMt5qLiRACN//N1fwMAAA==
X-CMS-MailID: 20231124124238eucas1p12bbd91d96c9fc9f7c7a784449e32e547
X-Msg-Generator: CA
X-RootMTR: 20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
 <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
 <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
 <CGME20231122092952eucas1p291af9a5570a05c67014f5c871c85e98c@eucas1p2.samsung.com>
 <39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org>
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
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 Steven Price <steven.price@arm.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, wenst@chromium.org, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------v9Ek02MQmsoyOM0vpi0WeeQM
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"


On 22.11.2023 10:29, Krzysztof Kozlowski wrote:
> On 22/11/2023 10:06, AngeloGioacchino Del Regno wrote:
>>>>> Hey Krzysztof,
>>>>>
>>>>> This is interesting. It might be about the cores that are missing from the partial
>>>>> core_mask raising interrupts, but an external abort on non-linefetch is strange to
>>>>> see here.
>>>> I've seen such external aborts in the past, and the fault type has
>>>> often been misleading. It's unlikely to have anything to do with a
>>> Yeah, often accessing device with power or clocks gated.
>>>
>> Except my commit does *not* gate SoC power, nor SoC clocks 🙂
> It could be that something (like clocks or power supplies) was missing
> on this board/SoC, which was not critical till your patch came.
>
>> What the "Really power off ..." commit does is to ask the GPU to internally power
>> off the shaders, tilers and L2, that's why I say that it is strange to see that
>> kind of abort.
>>
>> The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and GPU_FAULT_ADDRESS_{HI/LO}
>> registers should still be accessible even with shaders, tilers and cache OFF.
>>
>> Anyway, yes, synchronizing IRQs before calling the poweroff sequence would also
>> work, but that'd add up quite a bit of latency on the runtime_suspend() call, so
>> in this case I'd be more for avoiding to execute any register r/w in the handler
>> by either checking if the GPU is supposed to be OFF, or clearing interrupts, which
>> may not work if those are generated after the execution of the poweroff function.
>> Or we could simply disable the irq after power_off, but that'd be hacky (as well).
>>
>>
>> Let's see if asking to poweroff *everything* works:
> Worked.

Yes, I also got into this issue some time ago, but I didn't report it 
because I also had some power supply related problems on my test farm 
and everything was a bit unstable. I wasn't 100% sure that the $subject 
patch is responsible for the observed issues. Now, after fixing power 
supply, I confirm that the issue was revealed by the $subject patch and 
above mentioned change fixes the problem. Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--------------v9Ek02MQmsoyOM0vpi0WeeQM
Content-Type: multipart/related;
	boundary="----aPPYFQoPokT9G-mHbQj.jdmNS2MAYS47EW2jJt75N-gt-C98=_72bf_"

------aPPYFQoPokT9G-mHbQj.jdmNS2MAYS47EW2jJt75N-gt-C98=_72bf_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 22.11.2023 10:29, Krzysztof
      Kozlowski wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:39e9514b-087c-42eb-8d0e-f75dc620e954@linaro.org">
      <pre class="moz-quote-pre" wrap="">On 22/11/2023 10:06, AngeloGioacchino Del Regno wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
Hey Krzysztof,

This is interesting. It might be about the cores that are missing from the partial
core_mask raising interrupts, but an external abort on non-linefetch is strange to
see here.
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I've seen such external aborts in the past, and the fault type has
often been misleading. It's unlikely to have anything to do with a
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
Yeah, often accessing device with power or clocks gated.

</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Except my commit does *not* gate SoC power, nor SoC clocks 🙂
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It could be that something (like clocks or power supplies) was missing
on this board/SoC, which was not critical till your patch came.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
What the "Really power off ..." commit does is to ask the GPU to internally power
off the shaders, tilers and L2, that's why I say that it is strange to see that
kind of abort.

The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and GPU_FAULT_ADDRESS_{HI/LO}
registers should still be accessible even with shaders, tilers and cache OFF.

Anyway, yes, synchronizing IRQs before calling the poweroff sequence would also
work, but that'd add up quite a bit of latency on the runtime_suspend() call, so
in this case I'd be more for avoiding to execute any register r/w in the handler
by either checking if the GPU is supposed to be OFF, or clearing interrupts, which
may not work if those are generated after the execution of the poweroff function.
Or we could simply disable the irq after power_off, but that'd be hacky (as well).


Let's see if asking to poweroff *everything* works:
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Worked.</pre>
    </blockquote>
    <p>Yes, I also got into this issue some time ago, but I didn't
      report it because I also had some power supply related problems on
      my test farm and everything was a bit unstable. I wasn't 100% sure
      that the $subject patch is responsible for the observed issues.
      Now, after fixing power supply, I confirm that the issue was
      revealed by the $subject patch and above mentioned change fixes
      the problem. Feel free to add:</p>
    <p>Tested-by: Marek Szyprowski <a class="moz-txt-link-rfc2396E" href="mailto:m.szyprowski@samsung.com">&lt;m.szyprowski@samsung.com&gt;</a><br>
    </p>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <pre class="moz-signature" cols="72">Best regards
-- 
Marek Szyprowski, PhD
Samsung R&amp;D Institute Poland</pre>
  <table id=bannersignimg data-cui-lock="true" namo_lock><tr><td><p>&nbsp;</p>
</td></tr></table><table id=confidentialsignimg data-cui-lock="true" namo_lock><tr><td><p><img unselectable="on" data-cui-image="true" style="display: inline-block; border: 0px solid; width: 520px; height: 144px;" src="cid:cafe_image_0@s-core.co.kr"><br></p>
</td></tr></table></body>
</html>
<table style='display: none;'><tbody><tr><td><img style='display: none;' border=0 src='http://ext.w1.samsung.net/mail/ext/v1/external/status/update?userid=m.szyprowski&do=bWFpbElEPTIwMjMxMTI0MTI0MjM4ZXVjYXMxcDEyYmJkOTFkOTZjOWZjOWY3YzdhNzg0NDQ5ZTMyZTU0NyZyZWNpcGllbnRBZGRyZXNzPWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc_' width=0 height=0></td></tr></tbody></table>
------aPPYFQoPokT9G-mHbQj.jdmNS2MAYS47EW2jJt75N-gt-C98=_72bf_
Content-Type: image/png
Content-Transfer-Encoding: base64
Content-ID: <cafe_image_0@s-core.co.kr>

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


------aPPYFQoPokT9G-mHbQj.jdmNS2MAYS47EW2jJt75N-gt-C98=_72bf_--

--------------v9Ek02MQmsoyOM0vpi0WeeQM--
