Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C16E7E1B8B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 08:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4283110E274;
	Mon,  6 Nov 2023 07:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6BF10E274
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 07:54:26 +0000 (UTC)
Received: from [192.168.88.20] (91-158-149-209.elisa-laajakaista.fi
 [91.158.149.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67CC3583;
 Mon,  6 Nov 2023 08:54:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1699257245;
 bh=AWiS/+jyJMw7C0hLOtwr+kKJPUeb1haOClFxpULuZmQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bRNag+XLKR94Pj/WFtofhAXLUJHlB2O/+yrJ6QbX7x5cwiseopn8n2tGmpv3VwOZm
 x/UFvnQ6lhi6XmhAGoiNgKYCU3yUT3P0xQX5TaLVmKQhcF+rn2qEdVRPiZ23c1Pagr
 jFgEfyEYQxD84TboUBKY+Mvsqg1wXCge3Xa//rag=
Message-ID: <c0c735f7-e00a-4574-9edc-07bc83012070@ideasonboard.com>
Date: Mon, 6 Nov 2023 09:54:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/tidss: Use PM autosuspend
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20231101-tidss-probe-v1-0-45149e0f9415@ideasonboard.com>
 <20231101-tidss-probe-v1-2-45149e0f9415@ideasonboard.com>
 <20231101135406.GR12764@pendragon.ideasonboard.com>
 <7395880d-36ba-471c-ba7c-745a0ec8e5de@ideasonboard.com>
 <20231105225330.GA15635@pendragon.ideasonboard.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20231105225330.GA15635@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Sakari Ailus <sakari.ailus@iki.fi>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/11/2023 00:53, Laurent Pinchart wrote:
> Hi Tomi,
> 
> CC'ing Sakari for his expertise on runtime PM (I think he will soon
> start wishing he would be ignorant in this area).
> 
> On Thu, Nov 02, 2023 at 08:34:45AM +0200, Tomi Valkeinen wrote:
>> On 01/11/2023 15:54, Laurent Pinchart wrote:
>>> On Wed, Nov 01, 2023 at 11:17:39AM +0200, Tomi Valkeinen wrote:
>>>> Use runtime PM autosuspend feature, with 1s timeout, to avoid
>>>> unnecessary suspend-resume cycles when, e.g. the userspace temporarily
>>>> turns off the crtcs when configuring the outputs.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/gpu/drm/tidss/tidss_drv.c | 8 +++++++-
>>>>    1 file changed, 7 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
>>>> index f403db11b846..64914331715a 100644
>>>> --- a/drivers/gpu/drm/tidss/tidss_drv.c
>>>> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
>>>> @@ -43,7 +43,9 @@ void tidss_runtime_put(struct tidss_device *tidss)
>>>>    
>>>>    	dev_dbg(tidss->dev, "%s\n", __func__);
>>>>    
>>>> -	r = pm_runtime_put_sync(tidss->dev);
>>>> +	pm_runtime_mark_last_busy(tidss->dev);
>>>> +
>>>> +	r = pm_runtime_put_autosuspend(tidss->dev);
>>>>    	WARN_ON(r < 0);
>>>>    }
>>>>    
>>>> @@ -144,6 +146,9 @@ static int tidss_probe(struct platform_device *pdev)
>>>>    
>>>>    	pm_runtime_enable(dev);
>>>>    
>>>> +	pm_runtime_set_autosuspend_delay(dev, 1000);
>>>> +	pm_runtime_use_autosuspend(dev);
>>>> +
>>>>    #ifndef CONFIG_PM
>>>>    	/* If we don't have PM, we need to call resume manually */
>>>>    	dispc_runtime_resume(tidss->dispc);
>>>
>>> By the way, there's a way to handle this without any ifdef:
>>>
>>> 	dispc_runtime_resume(tidss->dispc);
>>>
>>> 	pm_runtime_set_active(dev);
>>> 	pm_runtime_get_noresume(dev);
>>> 	pm_runtime_enable(dev);
>>> 	pm_runtime_set_autosuspend_delay(dev, 1000);
>>> 	pm_runtime_use_autosuspend(dev);
>>
>> I'm not sure I follow what you are trying to do here. The call to
>> dispc_runtime_resume() would crash if we have PM, as the HW would not be
>> enabled at that point.
> 
> Isn't dispc_runtime_resume() meant to enable the hardware ?
> 
> The idea is to enable the hardware, then enable runtime PM, and tell the
> runtime PM framework that the device is enabled. If CONFIG_PM is not
> set, the RPM calls will be no-ops, and the device will stay enable. If
> CONFIG_PM is set, the device will be enabled, and will get disabled at
> end of probe by a call to pm_runtime_put_autosuspend().

(The text below is more about the end result of this series, rather than 
this specific patch):

Hmm, no, I don't think that's how it works. My understanding is this:

There are multiple parts "enabling the hardware", and I think they 
usually need to be done in this order: 1) enabling the parent devices, 
2) system level HW module enable (this is possibly really part of the 
1), 3) clk/regulator/register setup.

3) is handled by the driver, but 1) and 2) are handled via the runtime 
PM framework. Calling dispc_runtime_resume() as the first thing could 
mean that DSS's parents are not enabled or that the DSS HW module is not 
enabled at the system control level.

That's why I first call pm_runtime_set_active(), which should handle 1) 
and 2).

The only thing dispc_runtime_resume() does wrt. enabling the hardware is 
enabling the fclk. It does a lot more, but all the rest is just 
configuring the hardware to settings that we always want to use (e.g. 
fifo management).

Now, if the bootloader had enabled the display, and the driver did:

- pm_runtime_enable()
- pm_runtime_get()
- dispc_reset()

it would cause dispc_runtime_resume() to be called before the reset. 
This would mean that the dispc_runtime_resume() would be changing 
settings that must not be changed while streaming is enabled.

We could do a DSS reset always as the first thing in 
dispc_runtime_resume() (after enabling the fclk), but that feels a bit 
pointless as after the first reset the DSS is in a known state.

Also, if we don't do a reset at probe time, there are things we need to 
take care of: at least we need to mask the IRQs (presuming we register 
the DSS interrupt at probe time). But generally speaking, I feel a bit 
uncomfortable leaving an IP possibly running in an unknown state after 
probe. I'd much rather just reset it at probe.

  Tomi

