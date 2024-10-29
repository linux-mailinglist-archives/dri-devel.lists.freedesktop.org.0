Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E20B9B4827
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 12:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA72410E62D;
	Tue, 29 Oct 2024 11:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uS/eoiZa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCA010E152
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 11:21:48 +0000 (UTC)
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi
 [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BD0BDAF;
 Tue, 29 Oct 2024 12:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1730200904;
 bh=+iSxGyR5HMdRDEZYhR3oc66Pg0IHmzVX+ZFiOgRmuK0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uS/eoiZaZuzgl+EDTL55f3awxUH3t24BLiREDoTc3HqFFcA0OUloX9WQlf+504c+d
 KV3PewFjZBuUzP25Jn8n0MnEgW+KbfWzaRb81dAkR51pwOzSX1VGd4d+N1APA19El6
 JAH3QxsY1eYAofXBdkU93Bo88okdSu/q9qfuDC34=
Content-Type: multipart/mixed; boundary="------------oyD0P5rhgVTVdKLZEq360Ft8"
Message-ID: <10e892a8-2b07-480e-93c1-3083ce31e7e2@ideasonboard.com>
Date: Tue, 29 Oct 2024 13:21:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver core: fw_devlink: Stop trying to optimize cycle
 detection logic
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Devarsh Thakkar <devarsht@ti.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel-team@android.com,
 linux-kernel@vger.kernel.org
References: <20241026045243.452957-1-saravanak@google.com>
 <76eb4a60-e192-4018-9770-4b973075a3cb@ideasonboard.com>
 <CAGETcx99+EA=t6KaWCWbHk=Xjj32UAKepktZkmLuap=K5G9h3w@mail.gmail.com>
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
In-Reply-To: <CAGETcx99+EA=t6KaWCWbHk=Xjj32UAKepktZkmLuap=K5G9h3w@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------oyD0P5rhgVTVdKLZEq360Ft8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 28/10/2024 22:39, Saravana Kannan wrote:
> On Mon, Oct 28, 2024 at 1:06 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> Hi,
>>
>> On 26/10/2024 07:52, Saravana Kannan wrote:
>>> In attempting to optimize fw_devlink runtime, I introduced numerous cycle
>>> detection bugs by foregoing cycle detection logic under specific
>>> conditions. Each fix has further narrowed the conditions for optimization.
>>>
>>> It's time to give up on these optimization attempts and just run the cycle
>>> detection logic every time fw_devlink tries to create a device link.
>>>
>>> The specific bug report that triggered this fix involved a supplier fwnode
>>> that never gets a device created for it. Instead, the supplier fwnode is
>>> represented by the device that corresponds to an ancestor fwnode.
>>>
>>> In this case, fw_devlink didn't do any cycle detection because the cycle
>>> detection logic is only run when a device link is created between the
>>> devices that correspond to the actual consumer and supplier fwnodes.
>>>
>>> With this change, fw_devlink will run cycle detection logic even when
>>> creating SYNC_STATE_ONLY proxy device links from a device that is an
>>> ancestor of a consumer fwnode.
>>>
>>> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> Closes: https://lore.kernel.org/all/1a1ab663-d068-40fb-8c94-f0715403d276@ideasonboard.com/
>>> Fixes: 6442d79d880c ("driver core: fw_devlink: Improve detection of overlapping cycles")
>>> Signed-off-by: Saravana Kannan <saravanak@google.com>
>>> ---
>>> Greg,
>>>
>>> I've tested this on my end and it looks ok and nothing fishy is going
>>> on. You can pick this up once Tomi gives a Tested-by.
>>
>> I tested this on TI AM62 SK board. It has an LVDS (OLDI) display and a
>> HDMI output, and both displays are connected to the same display
>> subsystem. I tested with OLDI single and dual link cases, with and
>> without HDMI, and in all cases probing works fine.
>>
>> Looks good on that front, so:
>>
>> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> Great! Thanks!
> 
>> You also asked for a diff of the devlinks. That part doesn't look so
>> good to me, but probably you can tell if it's normal or not.
> 
> TL;DR: All device links in a cycle get marked as
> DL_FLAG_SYNC_STATE_ONLY and DL_FLAG_CYCLE (in addition to other
> flags). All DL_FLAG_SYNC_STATE_ONLY (not all of them are cycles) will
> get deleted after the consumer probes (since they are no longer needed
> after that). My guess on what's going on is that with the patch,
> fw_devlink found and marked more device links as cycles. Ones that in
> the past weren't detected as being part of a cycle but coincidentally
> the "post-init" dependency was the one that was getting ignored/not
> enforced. So the actual links in a cycle getting deleted after all the
> devices have probed is not a problem.

Ok. Yep, it might all be fine. I still don't understand all that's going 
on here, so maybe look at one more case below.

> You can enable the "cycle" logs in drivers/base/core.c so it's easier
> to follow the cycles fw_devlink detected. But the logs are a bit
> cryptic because it tries to print all the multiple cycles that were
> detected using a recursive search.
> 
> The non-cycle use for DL_FLAG_SYNC_STATE_ONLY is for parent devices to
> put a "proxy-vote" (Hey supplier, you still have a consumer that
> hasn't bound to a driver yet) for descendant (children, grand
> children) devices that haven't been created yet. So, without the fix
> it's possible some descendant child never got to probe and the
> DL_FLAG_SYNC_STATE_ONLY device link stuck around.
> 
> If you can confirm all the deleted device links fall into one of these
> two categories, then there's no issue here. If you find cases that
> aren't clear, then let me know which one and point to specific nodes
> in an upstream DTS file and I can take a look.
> 
> Every device link folder has a "sync_state_only" file that says if it
> has the DL_FLAG_SYNC_STATE_ONLY set. But to check for the cycle flag,
> you'll have to extend the debug log in device_link_add() that goes:
> "Linked as a sync state only consumer to......" and print the "flags" param.

I added this print.

I thought I'll test without any non-upstream patches, so this is booting 
with the upstream k3-am625-sk.dtb, no overlays. I've attached boot log 
(with this patch applied), and devlink lists, without and with this patch.

As the OLDI stuff is not upstream, I did expect to see less diff, and 
that is the case. It's still somewhat interesting diff:

$ diff devlink-broken.txt devlink-fixed.txt
1d0
< i2c:1-0022--i2c:1-003b

So that's the gpio expander (exp1: gpio@22 in k3-am625-sk.dts) and the 
hdmi bridge (sii9022: bridge-hdmi@3b in k3-am62x-sk-common.dtsi). And, 
indeed, in the log I can see:

i2c 1-003b: Linked as a sync state only consumer to 1-0022 (flags 0x3c0)
/bus@f0000/i2c@20010000/bridge-hdmi@3b Dropping the fwnode link to 
/bus@f0000/i2c@20010000/gpio@22

If I'm not mistaken, the above means that the framework has decided 
there's a (possible) probe time cyclic dependency between the gpio 
expander and the hdmi bridge, right?

I don't think that makes sense, and I was trying to understand why the 
framework has arrived to such a conclusion, but it's not clear to me.

Also, I can see, e.g.:

/bus@f0000/i2c@20010000: cycle: depends on /bus@f0000/dss@30200000

So somehow the i2c bus has a dependency on the DSS? The DSS does not 
depend on the i2c, but the HDMI does, so I can understand that the DSS 
would have a dependency to i2c. But the other way around?

  Tomi

>>
>> $ diff devlink-single-broken.txt devlink-single-fixed.txt
> 
> I was hoping you'd give me some line count diff too to get a sense of
> if it's wreaking havoc or not. But based on my local testing on
> different hardware, I'm expecting a very small number of device links
> are getting affected.
> 
>> 2d1
>> < i2c:1-0022--i2c:1-003b
>> 11d9
>> <
>> platform:44043000.system-controller:clock-controller--platform:20010000.i2c
>> 27d24
>> < platform:44043000.system-controller:clock-controller--platform:601000.gpio
>> 42d38
>> <
>> platform:44043000.system-controller:power-controller--platform:20010000.i2c
>> 58d53
>> < platform:44043000.system-controller:power-controller--platform:601000.gpio
>> 74d68
>> < platform:4d000000.mailbox--platform:44043000.system-controller
> 
> I took a quick look at this one in
> arch/arm64/boot/dts/ti/k3-am62-main.dtsi which I assume is part of the
> device you are testing on and I couldn't find a cycle. But with dtsi
> and dts files, it's hard to find these manually. Let me know if
> fw_devlink is thinking there's a cycle where there is none.
> 
>> 76d69
>> < platform:601000.gpio--i2c:1-0022
>> 80d72
>> < platform:bus@f0000:interrupt-controller@a00000--platform:601000.gpio
>> 82d73
>> < platform:f4000.pinctrl--i2c:1-0022
>> 84d74
>> < platform:f4000.pinctrl--platform:20010000.i2c
>>
>> "i2c:1-003b" is the hdmi bridge, "i2c:1-0022" is a gpio expander. So,
>> for example, we lose the devlink between the gpio expander and the hdmi
>> bridge. The expander is used for interrupts. There's an interrupt line
>> from the HDMI bridge to the expander, and from there there's an
>> interrupt line going to the SoC.
>>
>> Also, I noticed the devlinks change if I load the display drivers. The
>> above is before loading. Comparing the loaded/not-loaded:
> 
> Yeah, DL_FLAG_SYNC_STATE_ONLY device links vanishing as more devices
> probe is not a problem. That's working as intended.
> 
> Thanks,
> Saravana
> 
>>
>> $ diff devlink-dual-fixed.txt devlink-dual-fixed-loaded.txt
>> 3d2
>> < i2c:1-003b--platform:30200000.dss
>> 23d21
>> <
>> platform:44043000.system-controller:clock-controller--platform:30200000.dss
>> 52d49
>> <
>> platform:44043000.system-controller:power-controller--platform:30200000.dss
>> 73d69
>> < platform:display--platform:30200000.dss
>> 78d73
>> < platform:f4000.pinctrl--platform:30200000.dss
>> 97a93
>>   > regulator:regulator.0--platform:display
>>
>>    Tomi
>>
>>
>>> Thanks,
>>> Saravana
>>>
>>> v1 -> v2:
>>> - Removed the RFC tag
>>> - Remaned the subject. v1 is https://lore.kernel.org/all/20241025223721.184998-1-saravanak@google.com/T/#u
>>> - Added a NULL check to avoid NULL pointer deref
>>>
>>>    drivers/base/core.c | 46 ++++++++++++++++++++-------------------------
>>>    1 file changed, 20 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>>> index 3b13fed1c3e3..f96f2e4c76b4 100644
>>> --- a/drivers/base/core.c
>>> +++ b/drivers/base/core.c
>>> @@ -1990,10 +1990,10 @@ static struct device *fwnode_get_next_parent_dev(const struct fwnode_handle *fwn
>>>     *
>>>     * Return true if one or more cycles were found. Otherwise, return false.
>>>     */
>>> -static bool __fw_devlink_relax_cycles(struct device *con,
>>> +static bool __fw_devlink_relax_cycles(struct fwnode_handle *con_handle,
>>>                                 struct fwnode_handle *sup_handle)
>>>    {
>>> -     struct device *sup_dev = NULL, *par_dev = NULL;
>>> +     struct device *sup_dev = NULL, *par_dev = NULL, *con_dev = NULL;
>>>        struct fwnode_link *link;
>>>        struct device_link *dev_link;
>>>        bool ret = false;
>>> @@ -2010,22 +2010,22 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>>>
>>>        sup_handle->flags |= FWNODE_FLAG_VISITED;
>>>
>>> -     sup_dev = get_dev_from_fwnode(sup_handle);
>>> -
>>>        /* Termination condition. */
>>> -     if (sup_dev == con) {
>>> +     if (sup_handle == con_handle) {
>>>                pr_debug("----- cycle: start -----\n");
>>>                ret = true;
>>>                goto out;
>>>        }
>>>
>>> +     sup_dev = get_dev_from_fwnode(sup_handle);
>>> +     con_dev = get_dev_from_fwnode(con_handle);
>>>        /*
>>>         * If sup_dev is bound to a driver and @con hasn't started binding to a
>>>         * driver, sup_dev can't be a consumer of @con. So, no need to check
>>>         * further.
>>>         */
>>>        if (sup_dev && sup_dev->links.status ==  DL_DEV_DRIVER_BOUND &&
>>> -         con->links.status == DL_DEV_NO_DRIVER) {
>>> +         con_dev && con_dev->links.status == DL_DEV_NO_DRIVER) {
>>>                ret = false;
>>>                goto out;
>>>        }
>>> @@ -2034,7 +2034,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>>>                if (link->flags & FWLINK_FLAG_IGNORE)
>>>                        continue;
>>>
>>> -             if (__fw_devlink_relax_cycles(con, link->supplier)) {
>>> +             if (__fw_devlink_relax_cycles(con_handle, link->supplier)) {
>>>                        __fwnode_link_cycle(link);
>>>                        ret = true;
>>>                }
>>> @@ -2049,7 +2049,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>>>        else
>>>                par_dev = fwnode_get_next_parent_dev(sup_handle);
>>>
>>> -     if (par_dev && __fw_devlink_relax_cycles(con, par_dev->fwnode)) {
>>> +     if (par_dev && __fw_devlink_relax_cycles(con_handle, par_dev->fwnode)) {
>>>                pr_debug("%pfwf: cycle: child of %pfwf\n", sup_handle,
>>>                         par_dev->fwnode);
>>>                ret = true;
>>> @@ -2067,7 +2067,7 @@ static bool __fw_devlink_relax_cycles(struct device *con,
>>>                    !(dev_link->flags & DL_FLAG_CYCLE))
>>>                        continue;
>>>
>>> -             if (__fw_devlink_relax_cycles(con,
>>> +             if (__fw_devlink_relax_cycles(con_handle,
>>>                                              dev_link->supplier->fwnode)) {
>>>                        pr_debug("%pfwf: cycle: depends on %pfwf\n", sup_handle,
>>>                                 dev_link->supplier->fwnode);
>>> @@ -2140,25 +2140,19 @@ static int fw_devlink_create_devlink(struct device *con,
>>>                return -EINVAL;
>>>
>>>        /*
>>> -      * SYNC_STATE_ONLY device links don't block probing and supports cycles.
>>> -      * So, one might expect that cycle detection isn't necessary for them.
>>> -      * However, if the device link was marked as SYNC_STATE_ONLY because
>>> -      * it's part of a cycle, then we still need to do cycle detection. This
>>> -      * is because the consumer and supplier might be part of multiple cycles
>>> -      * and we need to detect all those cycles.
>>> +      * Don't try to optimize by not calling the cycle detection logic under
>>> +      * certain conditions. There's always some corner case that won't get
>>> +      * detected.
>>>         */
>>> -     if (!device_link_flag_is_sync_state_only(flags) ||
>>> -         flags & DL_FLAG_CYCLE) {
>>> -             device_links_write_lock();
>>> -             if (__fw_devlink_relax_cycles(con, sup_handle)) {
>>> -                     __fwnode_link_cycle(link);
>>> -                     flags = fw_devlink_get_flags(link->flags);
>>> -                     pr_debug("----- cycle: end -----\n");
>>> -                     dev_info(con, "Fixed dependency cycle(s) with %pfwf\n",
>>> -                              sup_handle);
>>> -             }
>>> -             device_links_write_unlock();
>>> +     device_links_write_lock();
>>> +     if (__fw_devlink_relax_cycles(link->consumer, sup_handle)) {
>>> +             __fwnode_link_cycle(link);
>>> +             flags = fw_devlink_get_flags(link->flags);
>>> +             pr_debug("----- cycle: end -----\n");
>>> +             pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
>>> +                     link->consumer, sup_handle);
>>>        }
>>> +     device_links_write_unlock();
>>>
>>>        if (sup_handle->flags & FWNODE_FLAG_NOT_DEVICE)
>>>                sup_dev = fwnode_get_next_parent_dev(sup_handle);
>>

--------------oyD0P5rhgVTVdKLZEq360Ft8
Content-Type: text/plain; charset=UTF-8; name="boot-fixed.txt"
Content-Disposition: attachment; filename="boot-fixed.txt"
Content-Transfer-Encoding: base64

Qm9vdGluZyBMaW51eCBvbiBwaHlzaWNhbCBDUFUgMHgwMDAwMDAwMDAwIFsweDQxMGZkMDM0
XQpMaW51eCB2ZXJzaW9uIDYuMTIuMC1yYzQrICh0b21iYUBkZXNrYXJpKSAoYWFyY2g2NC1s
aW51eC1nbnUtZ2NjIChVYnVudHUgMTMuMi4wLTIzdWJ1bnR1NCkgMTMuMi4wLCBHTlUgbGQg
KEdOVSBCaW51dGlscyBmb3IgVWJ1bnR1KSAyLjQyKSAjNSBTTVAgUFJFRU1QVCBUdWUgT2N0
IDI5IDEyOjU3OjIxIEVFVCAyMDI0Ck1hY2hpbmUgbW9kZWw6IFRleGFzIEluc3RydW1lbnRz
IEFNNjI1IFNLCmVmaTogVUVGSSBub3QgZm91bmQuClJlc2VydmVkIG1lbW9yeTogYnlwYXNz
IGxpbnV4LGNtYSBub2RlLCB1c2luZyBjbWRsaW5lIENNQSBwYXJhbXMgaW5zdGVhZApPRjog
cmVzZXJ2ZWQgbWVtOiBub2RlIGxpbnV4LGNtYSBjb21wYXRpYmxlIG1hdGNoaW5nIGZhaWwK
T0Y6IHJlc2VydmVkIG1lbTogMHgwMDAwMDAwMDljYTAwMDAwLi4weDAwMDAwMDAwOWNhZmZm
ZmYgKDEwMjQgS2lCKSBtYXAgbm9uLXJldXNhYmxlIHJhbW9vcHNAOWNhMDAwMDAKUmVzZXJ2
ZWQgbWVtb3J5OiBjcmVhdGVkIERNQSBtZW1vcnkgcG9vbCBhdCAweDAwMDAwMDAwOWRiMDAw
MDAsIHNpemUgMTIgTWlCCk9GOiByZXNlcnZlZCBtZW06IGluaXRpYWxpemVkIG5vZGUgcjVm
LWRtYS1tZW1vcnlAOWRiMDAwMDAsIGNvbXBhdGlibGUgaWQgc2hhcmVkLWRtYS1wb29sCk9G
OiByZXNlcnZlZCBtZW06IDB4MDAwMDAwMDA5ZGIwMDAwMC4uMHgwMDAwMDAwMDllNmZmZmZm
ICgxMjI4OCBLaUIpIG5vbWFwIG5vbi1yZXVzYWJsZSByNWYtZG1hLW1lbW9yeUA5ZGIwMDAw
MApPRjogcmVzZXJ2ZWQgbWVtOiAweDAwMDAwMDAwOWU3ODAwMDAuLjB4MDAwMDAwMDA5ZTdm
ZmZmZiAoNTEyIEtpQikgbm9tYXAgbm9uLXJldXNhYmxlIHRmYUA5ZTc4MDAwMApPRjogcmVz
ZXJ2ZWQgbWVtOiAweDAwMDAwMDAwOWU4MDAwMDAuLjB4MDAwMDAwMDA5ZmZmZmZmZiAoMjQ1
NzYgS2lCKSBub21hcCBub24tcmV1c2FibGUgb3B0ZWVAOWU4MDAwMDAKTlVNQTogRmFraW5n
IGEgbm9kZSBhdCBbbWVtIDB4MDAwMDAwMDA4MDAwMDAwMC0weDAwMDAwMDAwZmZmZmZmZmZd
Ck5PREVfREFUQSgwKSBhbGxvY2F0ZWQgW21lbSAweGZmYmM3NzAwLTB4ZmZiY2EwZmZdClpv
bmUgcmFuZ2VzOgogIERNQSAgICAgIFttZW0gMHgwMDAwMDAwMDgwMDAwMDAwLTB4MDAwMDAw
MDBmZmZmZmZmZl0KICBETUEzMiAgICBlbXB0eQogIE5vcm1hbCAgIGVtcHR5Ck1vdmFibGUg
em9uZSBzdGFydCBmb3IgZWFjaCBub2RlCkVhcmx5IG1lbW9yeSBub2RlIHJhbmdlcwogIG5v
ZGUgICAwOiBbbWVtIDB4MDAwMDAwMDA4MDAwMDAwMC0weDAwMDAwMDAwOWRhZmZmZmZdCiAg
bm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMDlkYjAwMDAwLTB4MDAwMDAwMDA5ZTZmZmZmZl0K
ICBub2RlICAgMDogW21lbSAweDAwMDAwMDAwOWU3MDAwMDAtMHgwMDAwMDAwMDllNzdmZmZm
XQogIG5vZGUgICAwOiBbbWVtIDB4MDAwMDAwMDA5ZTc4MDAwMC0weDAwMDAwMDAwOWZmZmZm
ZmZdCiAgbm9kZSAgIDA6IFttZW0gMHgwMDAwMDAwMGEwMDAwMDAwLTB4MDAwMDAwMDBmZmZm
ZmZmZl0KSW5pdG1lbSBzZXR1cCBub2RlIDAgW21lbSAweDAwMDAwMDAwODAwMDAwMDAtMHgw
MDAwMDAwMGZmZmZmZmZmXQpjbWE6IFJlc2VydmVkIDY0IE1pQiBhdCAweDAwMDAwMDAwZjlh
MDAwMDAgb24gbm9kZSAtMQpwc2NpOiBwcm9iaW5nIGZvciBjb25kdWl0IG1ldGhvZCBmcm9t
IERULgpwc2NpOiBQU0NJdjEuMSBkZXRlY3RlZCBpbiBmaXJtd2FyZS4KcHNjaTogVXNpbmcg
c3RhbmRhcmQgUFNDSSB2MC4yIGZ1bmN0aW9uIElEcwpwc2NpOiBUcnVzdGVkIE9TIG1pZ3Jh
dGlvbiBub3QgcmVxdWlyZWQKcHNjaTogU01DIENhbGxpbmcgQ29udmVudGlvbiB2MS40CnBl
cmNwdTogRW1iZWRkZWQgMzQgcGFnZXMvY3B1IHM5ODgzMiByODE5MiBkMzIyNDAgdTEzOTI2
NApwY3B1LWFsbG9jOiBzOTg4MzIgcjgxOTIgZDMyMjQwIHUxMzkyNjQgYWxsb2M9MzQqNDA5
NgpwY3B1LWFsbG9jOiBbMF0gMCBbMF0gMSBbMF0gMiBbMF0gMyAKRGV0ZWN0ZWQgVklQVCBJ
LWNhY2hlIG9uIENQVTAKQ1BVIGZlYXR1cmVzOiBkZXRlY3RlZDogR0lDIHN5c3RlbSByZWdp
c3RlciBDUFUgaW50ZXJmYWNlCkNQVSBmZWF0dXJlczogZGV0ZWN0ZWQ6IEFSTSBlcnJhdHVt
IDg0NTcxOQphbHRlcm5hdGl2ZXM6IGFwcGx5aW5nIGJvb3QgYWx0ZXJuYXRpdmVzCktlcm5l
bCBjb21tYW5kIGxpbmU6IGNvbnNvbGU9dHR5UzIsMTE1MjAwbjggcm9vdD0vZGV2L25mcyBy
dyBuZnNyb290PS9ob21lL3RvbWJhL25mcy9yb290ZnMzMix2Myx0Y3AgaXA9Ojo6OmJ1aWxk
cm9vdDpldGgwOmRoY3AgY21hPTY0TQpEZW50cnkgY2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVz
OiAyNjIxNDQgKG9yZGVyOiA5LCAyMDk3MTUyIGJ5dGVzLCBsaW5lYXIpCklub2RlLWNhY2hl
IGhhc2ggdGFibGUgZW50cmllczogMTMxMDcyIChvcmRlcjogOCwgMTA0ODU3NiBieXRlcywg
bGluZWFyKQpGYWxsYmFjayBvcmRlciBmb3IgTm9kZSAwOiAwIApCdWlsdCAxIHpvbmVsaXN0
cywgbW9iaWxpdHkgZ3JvdXBpbmcgb24uICBUb3RhbCBwYWdlczogNTI0Mjg4ClBvbGljeSB6
b25lOiBETUEKbWVtIGF1dG8taW5pdDogc3RhY2s6YWxsKHplcm8pLCBoZWFwIGFsbG9jOm9m
ZiwgaGVhcCBmcmVlOm9mZgpzdGFja2RlcG90OiBhbGxvY2F0aW5nIGhhc2ggdGFibGUgdmlh
IGFsbG9jX2xhcmdlX3N5c3RlbV9oYXNoCnN0YWNrZGVwb3QgaGFzaCB0YWJsZSBlbnRyaWVz
OiAxMzEwNzIgKG9yZGVyOiA5LCAyMDk3MTUyIGJ5dGVzLCBsaW5lYXIpCnNvZnR3YXJlIElP
IFRMQjogU1dJT1RMQiBib3VuY2UgYnVmZmVyIHNpemUgYWRqdXN0ZWQgdG8gMk1CCnNvZnR3
YXJlIElPIFRMQjogYXJlYSBudW0gNC4Kc29mdHdhcmUgSU8gVExCOiBtYXBwZWQgW21lbSAw
eDAwMDAwMDAwZjkzMDAwMDAtMHgwMDAwMDAwMGY5NTAwMDAwXSAoMk1CKQpTTFVCOiBIV2Fs
aWduPTY0LCBPcmRlcj0wLTMsIE1pbk9iamVjdHM9MCwgQ1BVcz00LCBOb2Rlcz0xCmZ0cmFj
ZTogYWxsb2NhdGluZyA0ODc0OSBlbnRyaWVzIGluIDE5MSBwYWdlcwpmdHJhY2U6IGFsbG9j
YXRlZCAxOTEgcGFnZXMgd2l0aCA3IGdyb3Vwcwp0cmFjZSBldmVudCBzdHJpbmcgdmVyaWZp
ZXIgZGlzYWJsZWQKUnVubmluZyBSQ1Ugc2VsZiB0ZXN0cwpSdW5uaW5nIFJDVSBzeW5jaHJv
bm91cyBzZWxmIHRlc3RzCnJjdTogUHJlZW1wdGlibGUgaGllcmFyY2hpY2FsIFJDVSBpbXBs
ZW1lbnRhdGlvbi4KcmN1OiAJUkNVIGV2ZW50IHRyYWNpbmcgaXMgZW5hYmxlZC4KcmN1OiAJ
UkNVIGxvY2tkZXAgY2hlY2tpbmcgaXMgZW5hYmxlZC4KcmN1OiAJUkNVIHJlc3RyaWN0aW5n
IENQVXMgZnJvbSBOUl9DUFVTPTUxMiB0byBucl9jcHVfaWRzPTQuCglUcmFtcG9saW5lIHZh
cmlhbnQgb2YgVGFza3MgUkNVIGVuYWJsZWQuCglSdWRlIHZhcmlhbnQgb2YgVGFza3MgUkNV
IGVuYWJsZWQuCglUcmFjaW5nIHZhcmlhbnQgb2YgVGFza3MgUkNVIGVuYWJsZWQuCnJjdTog
UkNVIGNhbGN1bGF0ZWQgdmFsdWUgb2Ygc2NoZWR1bGVyLWVubGlzdG1lbnQgZGVsYXkgaXMg
MjUgamlmZmllcy4KcmN1OiBBZGp1c3RpbmcgZ2VvbWV0cnkgZm9yIHJjdV9mYW5vdXRfbGVh
Zj0xNiwgbnJfY3B1X2lkcz00ClJ1bm5pbmcgUkNVIHN5bmNocm9ub3VzIHNlbGYgdGVzdHMK
UkNVIFRhc2tzOiBTZXR0aW5nIHNoaWZ0IHRvIDIgYW5kIGxpbSB0byAxIHJjdV90YXNrX2Ni
X2FkanVzdD0xIHJjdV90YXNrX2NwdV9pZHM9NC4KUkNVIFRhc2tzIFJ1ZGU6IFNldHRpbmcg
c2hpZnQgdG8gMiBhbmQgbGltIHRvIDEgcmN1X3Rhc2tfY2JfYWRqdXN0PTEgcmN1X3Rhc2tf
Y3B1X2lkcz00LgpSQ1UgVGFza3MgVHJhY2U6IFNldHRpbmcgc2hpZnQgdG8gMiBhbmQgbGlt
IHRvIDEgcmN1X3Rhc2tfY2JfYWRqdXN0PTEgcmN1X3Rhc2tfY3B1X2lkcz00LgpOUl9JUlFT
OiA2NCwgbnJfaXJxczogNjQsIHByZWFsbG9jYXRlZCBpcnFzOiAwCkdJQ3YzOiBHSUM6IFVz
aW5nIHNwbGl0IEVPSS9EZWFjdGl2YXRlIG1vZGUKR0lDdjM6IDI1NiBTUElzIGltcGxlbWVu
dGVkCkdJQ3YzOiAwIEV4dGVuZGVkIFNQSXMgaW1wbGVtZW50ZWQKUm9vdCBJUlEgaGFuZGxl
cjogZ2ljX2hhbmRsZV9pcnEKR0lDdjM6IEdJQ3YzIGZlYXR1cmVzOiAxNiBQUElzCkdJQ3Yz
OiBHSUNEX0NUUkwuRFM9MCwgU0NSX0VMMy5GSVE9MQpHSUN2MzogQ1BVMDogZm91bmQgcmVk
aXN0cmlidXRvciAwIHJlZ2lvbiAwOjB4MDAwMDAwMDAwMTg4MDAwMApJVFMgW21lbSAweDAx
ODIwMDAwLTB4MDE4MmZmZmZdCkdJQzogZW5hYmxpbmcgd29ya2Fyb3VuZCBmb3IgSVRTOiBT
b2Npb25leHQgU3lucXVhY2VyIHByZS1JVFMKSVRTQDB4MDAwMDAwMDAwMTgyMDAwMDogRGV2
aWNlcyBUYWJsZSB0b28gbGFyZ2UsIHJlZHVjZSBpZHMgMjAtPjE5CklUU0AweDAwMDAwMDAw
MDE4MjAwMDA6IGFsbG9jYXRlZCA1MjQyODggRGV2aWNlcyBAODA4MDAwMDAgKGZsYXQsIGVz
eiA4LCBwc3ogNjRLLCBzaHIgMCkKSVRTOiB1c2luZyBjYWNoZSBmbHVzaGluZyBmb3IgY21k
IHF1ZXVlCkdJQ3YzOiB1c2luZyBMUEkgcHJvcGVydHkgdGFibGUgQDB4MDAwMDAwMDA4MDMw
MDAwMApHSUM6IHVzaW5nIGNhY2hlIGZsdXNoaW5nIGZvciBMUEkgcHJvcGVydHkgdGFibGUK
R0lDdjM6IENQVTA6IHVzaW5nIGFsbG9jYXRlZCBMUEkgcGVuZGluZyB0YWJsZSBAMHgwMDAw
MDAwMDgwMzEwMDAwCnJjdTogc3JjdV9pbml0OiBTZXR0aW5nIHNyY3Vfc3RydWN0IHNpemVz
IGJhc2VkIG9uIGNvbnRlbnRpb24uCmFyY2hfdGltZXI6IGNwMTUgdGltZXIocykgcnVubmlu
ZyBhdCAyMDAuMDBNSHogKHBoeXMpLgpjbG9ja3NvdXJjZTogYXJjaF9zeXNfY291bnRlcjog
bWFzazogMHgzZmZmZmZmZmZmZmZmZmYgbWF4X2N5Y2xlczogMHgyZTIwNDlkM2U4LCBtYXhf
aWRsZV9uczogNDQwNzk1MjEwNjM0IG5zCnNjaGVkX2Nsb2NrOiA1OCBiaXRzIGF0IDIwME1I
eiwgcmVzb2x1dGlvbiA1bnMsIHdyYXBzIGV2ZXJ5IDQzOTgwNDY1MTExMDJucwpDb25zb2xl
OiBjb2xvdXIgZHVtbXkgZGV2aWNlIDgweDI1CkxvY2sgZGVwZW5kZW5jeSB2YWxpZGF0b3I6
IENvcHlyaWdodCAoYykgMjAwNiBSZWQgSGF0LCBJbmMuLCBJbmdvIE1vbG5hcgouLi4gTUFY
X0xPQ0tERVBfU1VCQ0xBU1NFUzogIDgKLi4uIE1BWF9MT0NLX0RFUFRIOiAgICAgICAgICA0
OAouLi4gTUFYX0xPQ0tERVBfS0VZUzogICAgICAgIDgxOTIKLi4uIENMQVNTSEFTSF9TSVpF
OiAgICAgICAgICA0MDk2Ci4uLiBNQVhfTE9DS0RFUF9FTlRSSUVTOiAgICAgMzI3NjgKLi4u
IE1BWF9MT0NLREVQX0NIQUlOUzogICAgICA2NTUzNgouLi4gQ0hBSU5IQVNIX1NJWkU6ICAg
ICAgICAgIDMyNzY4CiBtZW1vcnkgdXNlZCBieSBsb2NrIGRlcGVuZGVuY3kgaW5mbzogNjQy
OSBrQgogbWVtb3J5IHVzZWQgZm9yIHN0YWNrIHRyYWNlczogNDIyNCBrQgogcGVyIHRhc2st
c3RydWN0IG1lbW9yeSBmb290cHJpbnQ6IDE5MjAgYnl0ZXMKQ2FsaWJyYXRpbmcgZGVsYXkg
bG9vcCAoc2tpcHBlZCksIHZhbHVlIGNhbGN1bGF0ZWQgdXNpbmcgdGltZXIgZnJlcXVlbmN5
Li4gNDAwLjAwIEJvZ29NSVBTIChscGo9ODAwMDAwKQpwaWRfbWF4OiBkZWZhdWx0OiAzMjc2
OCBtaW5pbXVtOiAzMDEKTFNNOiBpbml0aWFsaXppbmcgbHNtPWNhcGFiaWxpdHkKTW91bnQt
Y2FjaGUgaGFzaCB0YWJsZSBlbnRyaWVzOiA0MDk2IChvcmRlcjogMywgMzI3NjggYnl0ZXMs
IGxpbmVhcikKTW91bnRwb2ludC1jYWNoZSBoYXNoIHRhYmxlIGVudHJpZXM6IDQwOTYgKG9y
ZGVyOiAzLCAzMjc2OCBieXRlcywgbGluZWFyKQpSdW5uaW5nIFJDVSBzeW5jaHJvbm91cyBz
ZWxmIHRlc3RzClJ1bm5pbmcgUkNVIHN5bmNocm9ub3VzIHNlbGYgdGVzdHMKUnVubmluZyBS
Q1UgVGFza3Mgd2FpdCBBUEkgc2VsZiB0ZXN0cwpSdW5uaW5nIFJDVSBUYXNrcyBSdWRlIHdh
aXQgQVBJIHNlbGYgdGVzdHMKUnVubmluZyBSQ1UgVGFza3MgVHJhY2Ugd2FpdCBBUEkgc2Vs
ZiB0ZXN0cwpyY3U6IEhpZXJhcmNoaWNhbCBTUkNVIGltcGxlbWVudGF0aW9uLgpyY3U6IAlN
YXggcGhhc2Ugbm8tZGVsYXkgaW5zdGFuY2VzIGlzIDEwMDAuClRpbWVyIG1pZ3JhdGlvbjog
MSBoaWVyYXJjaHkgbGV2ZWxzOyA4IGNoaWxkcmVuIHBlciBncm91cDsgMSBjcm9zc25vZGUg
bGV2ZWwKQ2FsbGJhY2sgZnJvbSBjYWxsX3JjdV90YXNrc190cmFjZSgpIGludm9rZWQuCkVG
SSBzZXJ2aWNlcyB3aWxsIG5vdCBiZSBhdmFpbGFibGUuCnNtcDogQnJpbmdpbmcgdXAgc2Vj
b25kYXJ5IENQVXMgLi4uCkRldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUxCkdJQ3YzOiBD
UFUxOiBmb3VuZCByZWRpc3RyaWJ1dG9yIDEgcmVnaW9uIDA6MHgwMDAwMDAwMDAxOGEwMDAw
CkdJQ3YzOiBDUFUxOiB1c2luZyBhbGxvY2F0ZWQgTFBJIHBlbmRpbmcgdGFibGUgQDB4MDAw
MDAwMDA4MDMyMDAwMApDUFUxOiBCb290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAweDAwMDAw
MDAwMDEgWzB4NDEwZmQwMzRdCkRldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUyCkdJQ3Yz
OiBDUFUyOiBmb3VuZCByZWRpc3RyaWJ1dG9yIDIgcmVnaW9uIDA6MHgwMDAwMDAwMDAxOGMw
MDAwCkdJQ3YzOiBDUFUyOiB1c2luZyBhbGxvY2F0ZWQgTFBJIHBlbmRpbmcgdGFibGUgQDB4
MDAwMDAwMDA4MDMzMDAwMApDUFUyOiBCb290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAweDAw
MDAwMDAwMDIgWzB4NDEwZmQwMzRdCkRldGVjdGVkIFZJUFQgSS1jYWNoZSBvbiBDUFUzCkdJ
Q3YzOiBDUFUzOiBmb3VuZCByZWRpc3RyaWJ1dG9yIDMgcmVnaW9uIDA6MHgwMDAwMDAwMDAx
OGUwMDAwCkdJQ3YzOiBDUFUzOiB1c2luZyBhbGxvY2F0ZWQgTFBJIHBlbmRpbmcgdGFibGUg
QDB4MDAwMDAwMDA4MDM0MDAwMApDUFUzOiBCb290ZWQgc2Vjb25kYXJ5IHByb2Nlc3NvciAw
eDAwMDAwMDAwMDMgWzB4NDEwZmQwMzRdCnNtcDogQnJvdWdodCB1cCAxIG5vZGUsIDQgQ1BV
cwpTTVA6IFRvdGFsIG9mIDQgcHJvY2Vzc29ycyBhY3RpdmF0ZWQuCkNQVTogQWxsIENQVShz
KSBzdGFydGVkIGF0IEVMMgpDUFUgZmVhdHVyZXM6IGRldGVjdGVkOiAzMi1iaXQgRUwwIFN1
cHBvcnQKQ1BVIGZlYXR1cmVzOiBkZXRlY3RlZDogQ1JDMzIgaW5zdHJ1Y3Rpb25zCmFsdGVy
bmF0aXZlczogYXBwbHlpbmcgc3lzdGVtLXdpZGUgYWx0ZXJuYXRpdmVzCk1lbW9yeTogMTg4
NjI2NEsvMjA5NzE1MksgYXZhaWxhYmxlICgxNTYxNksga2VybmVsIGNvZGUsIDQwNDZLIHJ3
ZGF0YSwgNjMwOEsgcm9kYXRhLCA1ODg4SyBpbml0LCAxNjcwMEsgYnNzLCAxMzMxMDBLIHJl
c2VydmVkLCA2NTUzNksgY21hLXJlc2VydmVkKQpkZXZ0bXBmczogaW5pdGlhbGl6ZWQKZGV2
aWNlOiAncGxhdGZvcm0nOiBkZXZpY2VfYWRkCmRldmljZTogJ21lbW9yeSc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbWVtb3J5MTYnOiBkZXZpY2VfYWRkCmRldmljZTogJ21lbW9yeTE3Jzog
ZGV2aWNlX2FkZApkZXZpY2U6ICdtZW1vcnkxOCc6IGRldmljZV9hZGQKZGV2aWNlOiAnbWVt
b3J5MTknOiBkZXZpY2VfYWRkCmRldmljZTogJ21lbW9yeTIwJzogZGV2aWNlX2FkZApkZXZp
Y2U6ICdtZW1vcnkyMSc6IGRldmljZV9hZGQKZGV2aWNlOiAnbWVtb3J5MjInOiBkZXZpY2Vf
YWRkCmRldmljZTogJ21lbW9yeTIzJzogZGV2aWNlX2FkZApkZXZpY2U6ICdtZW1vcnkyNCc6
IGRldmljZV9hZGQKZGV2aWNlOiAnbWVtb3J5MjUnOiBkZXZpY2VfYWRkCmRldmljZTogJ21l
bW9yeTI2JzogZGV2aWNlX2FkZApkZXZpY2U6ICdtZW1vcnkyNyc6IGRldmljZV9hZGQKZGV2
aWNlOiAnbWVtb3J5MjgnOiBkZXZpY2VfYWRkCmRldmljZTogJ21lbW9yeTI5JzogZGV2aWNl
X2FkZApkZXZpY2U6ICdtZW1vcnkzMCc6IGRldmljZV9hZGQKZGV2aWNlOiAnbWVtb3J5MzEn
OiBkZXZpY2VfYWRkCmRldmljZTogJ25vZGUnOiBkZXZpY2VfYWRkCmRldmljZTogJ25vZGUw
JzogZGV2aWNlX2FkZApkZXZpY2U6ICdjcHUnOiBkZXZpY2VfYWRkCmRldmljZTogJ2NwdTAn
OiBkZXZpY2VfYWRkCmRldmljZTogJ2NwdTEnOiBkZXZpY2VfYWRkCmRldmljZTogJ2NwdTIn
OiBkZXZpY2VfYWRkCmRldmljZTogJ2NwdTMnOiBkZXZpY2VfYWRkCmRldmljZTogJ2NvbnRh
aW5lcic6IGRldmljZV9hZGQKZGV2aWNlOiAnd29ya3F1ZXVlJzogZGV2aWNlX2FkZApSdW5u
aW5nIFJDVSBzeW5jaHJvbm91cyBzZWxmIHRlc3RzClJ1bm5pbmcgUkNVIHN5bmNocm9ub3Vz
IHNlbGYgdGVzdHMKRE1BLUFQSTogcHJlYWxsb2NhdGVkIDY1NTM2IGRlYnVnIGVudHJpZXMK
RE1BLUFQSTogZGVidWdnaW5nIGVuYWJsZWQgYnkga2VybmVsIGNvbmZpZwpjbG9ja3NvdXJj
ZTogamlmZmllczogbWFzazogMHhmZmZmZmZmZiBtYXhfY3ljbGVzOiAweGZmZmZmZmZmLCBt
YXhfaWRsZV9uczogNzY0NTA0MTc4NTEwMDAwMCBucwpmdXRleCBoYXNoIHRhYmxlIGVudHJp
ZXM6IDEwMjQgKG9yZGVyOiA1LCAxMzEwNzIgYnl0ZXMsIGxpbmVhcikKMjA1NjAgcGFnZXMg
aW4gcmFuZ2UgZm9yIG5vbi1QTFQgdXNhZ2UKNTEyMDgwIHBhZ2VzIGluIHJhbmdlIGZvciBQ
TFQgdXNhZ2UKcGluY3RybCBjb3JlOiBpbml0aWFsaXplZCBwaW5jdHJsIHN1YnN5c3RlbQpk
ZXZpY2U6ICdyZWctZHVtbXknOiBkZXZpY2VfYWRkCkNhbGxiYWNrIGZyb20gY2FsbF9yY3Vf
dGFza3MoKSBpbnZva2VkLgpETUkgbm90IHByZXNlbnQgb3IgaW52YWxpZC4KZGV2aWNlOiAn
cmVndWxhdG9yLjAnOiBkZXZpY2VfYWRkCk5FVDogUmVnaXN0ZXJlZCBQRl9ORVRMSU5LL1BG
X1JPVVRFIHByb3RvY29sIGZhbWlseQpETUE6IHByZWFsbG9jYXRlZCAyNTYgS2lCIEdGUF9L
RVJORUwgcG9vbCBmb3IgYXRvbWljIGFsbG9jYXRpb25zCkRNQTogcHJlYWxsb2NhdGVkIDI1
NiBLaUIgR0ZQX0tFUk5FTHxHRlBfRE1BIHBvb2wgZm9yIGF0b21pYyBhbGxvY2F0aW9ucwpE
TUE6IHByZWFsbG9jYXRlZCAyNTYgS2lCIEdGUF9LRVJORUx8R0ZQX0RNQTMyIHBvb2wgZm9y
IGF0b21pYyBhbGxvY2F0aW9ucwphdWRpdDogaW5pdGlhbGl6aW5nIG5ldGxpbmsgc3Vic3lz
IChkaXNhYmxlZCkKYXVkaXQ6IHR5cGU9MjAwMCBhdWRpdCgwLjM1MjoxKTogc3RhdGU9aW5p
dGlhbGl6ZWQgYXVkaXRfZW5hYmxlZD0wIHJlcz0xCmRldmljZTogJ3Z0Y29uMCc6IGRldmlj
ZV9hZGQKdGhlcm1hbF9zeXM6IFJlZ2lzdGVyZWQgdGhlcm1hbCBnb3Zlcm5vciAnc3RlcF93
aXNlJwp0aGVybWFsX3N5czogUmVnaXN0ZXJlZCB0aGVybWFsIGdvdmVybm9yICdwb3dlcl9h
bGxvY2F0b3InCmNwdWlkbGU6IHVzaW5nIGdvdmVybm9yIG1lbnUKaHctYnJlYWtwb2ludDog
Zm91bmQgNiBicmVha3BvaW50IGFuZCA0IHdhdGNocG9pbnQgcmVnaXN0ZXJzLgpBU0lEIGFs
bG9jYXRvciBpbml0aWFsaXNlZCB3aXRoIDY1NTM2IGVudHJpZXMKU2VyaWFsOiBBTUJBIFBM
MDExIFVBUlQgZHJpdmVyCmRldmljZTogJzljYTAwMDAwLnJhbW9vcHMnOiBkZXZpY2VfYWRk
CmRldmljZTogJ2Zpcm13YXJlOm9wdGVlJzogZGV2aWNlX2FkZApkZXZpY2U6ICdmaXJtd2Fy
ZTpwc2NpJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0aW1lci1jbDAtY3B1MCc6IGRldmljZV9h
ZGQKL3RpbWVyLWNsMC1jcHUwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVz
QGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKcGxhdGZvcm0gdGltZXItY2ww
LWNwdTA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgw
MDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL3RpbWVyLWNsMC1jcHUwIERyb3BwaW5n
IHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4
MDAwMDAKZGV2aWNlOiAncG11JzogZGV2aWNlX2FkZAovcG11IExpbmtlZCBhcyBhIGZ3bm9k
ZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAK
cGxhdGZvcm0gcG11OiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9s
bGVyQDE4MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2Ci9wbXUgRHJvcHBpbmcgdGhl
IGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAw
MApkZXZpY2U6ICdidXNAZjAwMDAnOiBkZXZpY2VfYWRkCi9idXNAZjAwMDAvYnVzQGIwMDAw
MC90YXJnZXQtbW9kdWxlQDJiMzAwMDUwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0
byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xs
ZXIKL2J1c0BmMDAwMC9idXNAYjAwMDAwL3RhcmdldC1tb2R1bGVAMmIzMDAwNTAgTGlua2Vk
IGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJA
NDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2J1c0BiMDAwMDAvcnRjQDJi
MWYwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL2ludGVy
cnVwdC1jb250cm9sbGVyQDE4MDAwMDAKL2J1c0BmMDAwMC9idXNAYjAwMDAwL3J0Y0AyYjFm
MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0t
Y29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvYnVzQGIw
MDAwMC9ydGNAMmIxZjAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNA
ZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgovYnVz
QGYwMDAwL2J1c0BiMDAwMDAvdGVtcGVyYXR1cmUtc2Vuc29yQGIwMDAwMCBMaW5rZWQgYXMg
YSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0
MzAwMC9wb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJA
MTgwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRl
cnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvYnVzQDEwMDAwMC9jbG9jay1j
b250cm9sbGVyQDgyZTAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAw
MDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYw
MDAwL2J1c0AxMDAwMDAvY2xvY2stY29udHJvbGxlckA4MmU0IExpbmtlZCBhcyBhIGZ3bm9k
ZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Ns
b2NrLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9idXNANDgwMDAwMDAvbWFpbGJveEA0ZDAwMDAw
MCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQt
Y29udHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvYnVzQDQ4MDAwMDAwL2ludGVycnVwdC1j
b250cm9sbGVyQDQ4MDAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVz
QGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKL2J1c0BmMDAwMC9idXNANDgw
MDAwMDAvZG1hLWNvbnRyb2xsZXJANDg1YzAxMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1
bWVyIHRvIC9idXNAZjAwMDAvYnVzQDQ4MDAwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDQ4
MDAwMDAwCi9idXNAZjAwMDAvYnVzQDQ4MDAwMDAwL2RtYS1jb250cm9sbGVyQDQ4NWMwMDAw
IExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL2J1c0A0ODAwMDAw
MC9pbnRlcnJ1cHQtY29udHJvbGxlckA0ODAwMDAwMAovYnVzQGYwMDAwL3N5c3RlbS1jb250
cm9sbGVyQDQ0MDQzMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYw
MDAwL2J1c0A0ODAwMDAwMC9tYWlsYm94QDRkMDAwMDAwCi9idXNAZjAwMDAvdGltZXJAMjQw
MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1
cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvdGltZXJAMjQwMDAwMCBMaW5rZWQg
YXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0
NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQwMDAwMCBMaW5r
ZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxl
ckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQxMDAwMCBM
aW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29u
dHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvdGltZXJAMjQxMDAwMCBMaW5rZWQgYXMgYSBm
d25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAw
MC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQxMDAwMCBMaW5rZWQgYXMg
YSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0
MzAwMC9wb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQyMDAwMCBMaW5rZWQg
YXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxl
ckAxODAwMDAwCi9idXNAZjAwMDAvdGltZXJAMjQyMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUg
Y29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9j
ay1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQyMDAwMCBMaW5rZWQgYXMgYSBmd25v
ZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9w
b3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQzMDAwMCBMaW5rZWQgYXMgYSBm
d25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAw
MDAwCi9idXNAZjAwMDAvdGltZXJAMjQzMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3Vt
ZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250
cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQzMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29u
c3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1j
b250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQ0MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUg
Y29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi9i
dXNAZjAwMDAvdGltZXJAMjQ0MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8g
L2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVy
Ci9idXNAZjAwMDAvdGltZXJAMjQ0MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIg
dG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9s
bGVyCi9idXNAZjAwMDAvdGltZXJAMjQ1MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3Vt
ZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAw
MDAvdGltZXJAMjQ1MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0Bm
MDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNA
ZjAwMDAvdGltZXJAMjQ1MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1
c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCi9i
dXNAZjAwMDAvdGltZXJAMjQ2MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8g
L2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvdGlt
ZXJAMjQ2MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9z
eXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAv
dGltZXJAMjQ2MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAw
MC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCi9idXNAZjAw
MDAvdGltZXJAMjQ3MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0Bm
MDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvdGltZXJAMjQ3
MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0t
Y29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJA
MjQ3MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0
ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvc2Vy
aWFsQDI4MDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAv
aW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMAovYnVzQGYwMDAwL3NlcmlhbEAyODAwMDAw
IExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250
cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9zZXJpYWxAMjgw
MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0t
Y29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvc2VyaWFs
QDI4MDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGlu
Y3RybEBmNDAwMC9tYWluLXVhcnQwLWRlZmF1bHQtcGlucwovYnVzQGYwMDAwL2kyY0AyMDAw
MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1
cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvaTJjQDIwMDAwMDAwIExpbmtlZCBh
cyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0
MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAgTGlua2Vk
IGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJA
NDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2kyY0AyMDAwMDAwMCBMaW5r
ZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwL21h
aW4taTJjMC1kZWZhdWx0LXBpbnMKL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhA
M2YvY29ubmVjdG9yIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAw
L2R3YzMtdXNiQGY5MDAwMDAvdXNiQDMxMDAwMDAwCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAw
IExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1j
b250cm9sbGVyQDE4MDAwMDAKL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAgTGlua2VkIGFzIGEg
Zndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMw
MDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMCBMaW5rZWQgYXMg
YSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0
MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAwIExpbmtlZCBh
cyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAvbWFpbi1p
MmMxLWRlZmF1bHQtcGlucwovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9hdWRpby1jb2RlY0Ax
YiBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL3JlZ3VsYXRvci0yCi9idXNAZjAw
MDAvaTJjQDIwMDEwMDAwL2F1ZGlvLWNvZGVjQDFiIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25z
dW1lciB0byAvcmVndWxhdG9yLTUKL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhk
bWlAM2IgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvaTJjQDIw
MDEwMDAwL2dwaW9AMjIKL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2Ig
TGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvZHNzQDMwMjAwMDAw
Ci9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiIExpbmtlZCBhcyBhIGZ3
bm9kZSBjb25zdW1lciB0byAvY29ubmVjdG9yLWhkbWkKL2J1c0BmMDAwMC9pMmNAMjAwMTAw
MDAvZ3Bpb0AyMiBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9n
cGlvQDYwMTAwMAovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyIExpbmtlZCBhcyBh
IGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAvbWFpbi1ncGlv
MS1pb2V4cC1pbnRyLWRlZmF1bHQtcGlucwovYnVzQGYwMDAwL2kyY0AyMDAyMDAwMCBMaW5r
ZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJv
bGxlckAxODAwMDAwCi9idXNAZjAwMDAvaTJjQDIwMDIwMDAwIExpbmtlZCBhcyBhIGZ3bm9k
ZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bv
d2VyLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9pMmNAMjAwMjAwMDAgTGlua2VkIGFzIGEgZndu
b2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAv
Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2kyY0AyMDAyMDAwMCBMaW5rZWQgYXMgYSBm
d25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwL21haW4taTJjMi1k
ZWZhdWx0LXBpbnMKL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckBhMDAwMDAgTGlu
a2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRy
b2xsZXJAMTgwMDAwMAovYnVzQGYwMDAwL2dwaW9ANjAwMDAwIExpbmtlZCBhcyBhIGZ3bm9k
ZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQGEwMDAwMAov
YnVzQGYwMDAwL2dwaW9ANjAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAv
YnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIK
L2J1c0BmMDAwMC9ncGlvQDYwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8g
L2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVy
Ci9idXNAZjAwMDAvZ3Bpb0A2MDEwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRv
IC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwCi9idXNAZjAwMDAvZ3Bp
b0A2MDEwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lz
dGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL2dw
aW9ANjAxMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3N5
c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9t
bWNAZmExMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9p
bnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAwMDAvbW1jQGZhMTAwMDAgTGlu
a2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xs
ZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL21tY0BmYTEwMDAwIExp
bmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9s
bGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9tbWNAZmExMDAwMCBM
aW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAw
L21haW4tbW1jMC1kZWZhdWx0LXBpbnMKL2J1c0BmMDAwMC9tbWNAZmEwMDAwMCBMaW5rZWQg
YXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxl
ckAxODAwMDAwCi9idXNAZjAwMDAvbW1jQGZhMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNv
bnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXIt
Y29udHJvbGxlcgovYnVzQGYwMDAwL21tY0BmYTAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBj
b25zdW1lciB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2Nr
LWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9tbWNAZmEwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUg
Y29uc3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwL21haW4tbW1jMS1kZWZhdWx0
LXBpbnMKL2J1c0BmMDAwMC9tbWNAZmEwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3Vt
ZXIgdG8gL3JlZ3VsYXRvci0zCi9idXNAZjAwMDAvbW1jQGZhMDAwMDAgTGlua2VkIGFzIGEg
Zndub2RlIGNvbnN1bWVyIHRvIC9yZWd1bGF0b3ItNAovYnVzQGYwMDAwL2R3YzMtdXNiQGY5
MDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVt
LWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2R3YzMt
dXNiQGY5MDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAv
c3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAw
L2R3YzMtdXNiQGY5MDAwMDAvdXNiQDMxMDAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25z
dW1lciB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKL2J1c0Bm
MDAwMC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUg
Y29uc3VtZXIgdG8gL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhAM2YvY29ubmVj
dG9yCi9idXNAZjAwMDAvZHdjMy11c2JAZjkxMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29u
c3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1j
b250cm9sbGVyCi9idXNAZjAwMDAvZHdjMy11c2JAZjkxMDAwMCBMaW5rZWQgYXMgYSBmd25v
ZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9w
b3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvZHdjMy11c2JAZjkxMDAwMC91c2JAMzExMDAw
MDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0
LWNvbnRyb2xsZXJAMTgwMDAwMAovYnVzQGYwMDAwL2R3YzMtdXNiQGY5MTAwMDAvdXNiQDMx
MTAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3BpbmN0
cmxAZjQwMDAvbWFpbi11c2IxLWRlZmF1bHQtcGlucwovYnVzQGYwMDAwL2J1c0BmYzAwMDAw
L3NwaUBmYzQwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAw
L2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKL2J1c0BmMDAwMC9idXNAZmMwMDAwMC9z
cGlAZmM0MDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9z
eXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAv
YnVzQGZjMDAwMDAvc3BpQGZjNDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRv
IC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxl
cgovYnVzQGYwMDAwL2J1c0BmYzAwMDAwL3NwaUBmYzQwMDAwIExpbmtlZCBhcyBhIGZ3bm9k
ZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAvb3NwaTAtZGVmYXVsdC1w
aW5zCi9idXNAZjAwMDAvZ3B1QGZkMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVy
IHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJv
bGxlcgovYnVzQGYwMDAwL2dwdUBmZDAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1l
ciB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKL2J1c0BmMDAw
MC9ncHVAZmQwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAw
MC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCi9idXNAZjAw
MDAvZXRoZXJuZXRAODAwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1
c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCi9i
dXNAZjAwMDAvZXRoZXJuZXRAODAwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIg
dG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9s
bGVyCi9idXNAZjAwMDAvZXRoZXJuZXRAODAwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29u
c3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwL21haW4tcmdtaWkxLWRlZmF1bHQt
cGlucwovYnVzQGYwMDAwL2V0aGVybmV0QDgwMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNv
bnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMC9tYWluLXJnbWlpMi1kZWZhdWx0
LXBpbnMKL2J1c0BmMDAwMC9ldGhlcm5ldEA4MDAwMDAwL2V0aGVybmV0LXBvcnRzL3BvcnRA
MSBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9idXNAMTAwMDAw
L3BoeUA0MDQ0Ci9idXNAZjAwMDAvZXRoZXJuZXRAODAwMDAwMC9ldGhlcm5ldC1wb3J0cy9w
b3J0QDIgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvYnVzQDEw
MDAwMC9waHlANDA0NAovYnVzQGYwMDAwL2V0aGVybmV0QDgwMDAwMDAvbWRpb0BmMDAgTGlu
a2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xs
ZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2V0aGVybmV0QDgwMDAw
MDAvbWRpb0BmMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAv
cGluY3RybEBmNDAwMC9tYWluLW1kaW8xLWRlZmF1bHQtcGlucwovYnVzQGYwMDAwL2V0aGVy
bmV0QDgwMDAwMDAvY3B0c0AzZDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8g
L2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVy
Ci9idXNAZjAwMDAvZXRoZXJuZXRAODAwMDAwMC9jcHRzQDNkMDAwIExpbmtlZCBhcyBhIGZ3
bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAw
MDAKL2J1c0BmMDAwMC9kc3NAMzAyMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVy
IHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJv
bGxlcgovYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3Vt
ZXIgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250
cm9sbGVyCi9idXNAZjAwMDAvZHNzQDMwMjAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25z
dW1lciB0byAvY2xvY2stZGl2aWRlci1vbGRpCi9idXNAZjAwMDAvZHNzQDMwMjAwMDAwIExp
bmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250
cm9sbGVyQDE4MDAwMDAKL2J1c0BmMDAwMC9kc3NAMzAyMDAwMDAgTGlua2VkIGFzIGEgZndu
b2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMC9tYWluLWRzczAtZGVm
YXVsdC1waW5zCi9idXNAZjAwMDAvZHNzQDMwMjAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBj
b25zdW1lciB0byAvYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9icmlkZ2UtaGRtaUAzYgovYnVz
QGYwMDAwL21haWxib3hAMjkwMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRv
IC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMAovYnVzQGYwMDAwL3dh
dGNoZG9nQGUwMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAw
MDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYw
MDAwL3dhdGNoZG9nQGUwMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9i
dXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgov
YnVzQGYwMDAwL3dhdGNoZG9nQGUwMTAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVy
IHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJv
bGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwMTAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNv
bnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXIt
Y29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwMjAwMDAgTGlua2VkIGFzIGEgZndu
b2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAv
Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwMjAwMDAgTGlua2VkIGFz
IGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQw
NDMwMDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwMzAwMDAgTGlu
a2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xs
ZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwMzAw
MDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNv
bnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9n
QGUwZjAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lz
dGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL3dh
dGNoZG9nQGUwZjAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAw
MDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYw
MDAwL2F1ZGlvLWNvbnRyb2xsZXJAMmIxMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3Vt
ZXIgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi9idXNAZjAw
MDAvYXVkaW8tY29udHJvbGxlckAyYjEwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1l
ciB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRy
b2xsZXIKL2J1c0BmMDAwMC9hdWRpby1jb250cm9sbGVyQDJiMTAwMDAgTGlua2VkIGFzIGEg
Zndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMw
MDAvcG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL2F1ZGlvLWNvbnRyb2xsZXJAMmIxMDAw
MCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0
MDAwL21haW4tbWNhc3AxLWRlZmF1bHQtcGlucwpwbGF0Zm9ybSBidXNAZjAwMDA6IE5vdCBs
aW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0
IG5ldmVyIGJlY29tZSBkZXYKLS0tLS0gY3ljbGU6IHN0YXJ0IC0tLS0tCi9idXNAZjAwMDAv
aW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0Bm
MDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCi0tLS0tIGN5Y2xlOiBlbmQgLS0t
LS0KL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwOiBGaXhlZCBkZXBl
bmRlbmN5IGN5Y2xlKHMpIHdpdGggL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAx
ODAwMDAwCnBsYXRmb3JtIGJ1c0BmMDAwMDogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRl
cnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgpwbGF0
Zm9ybSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRy
b2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKcGxhdGZvcm0gYnVzQGYw
MDAwOiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAw
MDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2CnBsYXRmb3JtIGJ1c0BmMDAwMDogTm90IGxp
bmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQg
bmV2ZXIgYmVjb21lIGRldgpwbGF0Zm9ybSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9idXNA
ZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29t
ZSBkZXYKcGxhdGZvcm0gYnVzQGYwMDAwOiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVy
cnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2CnBsYXRm
b3JtIGJ1c0BmMDAwMDogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJv
bGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgpwbGF0Zm9ybSBidXNAZjAw
MDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAw
MCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKcGxhdGZvcm0gYnVzQGYwMDAwOiBOb3QgbGlu
a2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBtaWdodCBu
ZXZlciBiZWNvbWUgZGV2CnBsYXRmb3JtIGJ1c0BmMDAwMDogTm90IGxpbmtpbmcgL2J1c0Bm
MDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21l
IGRldgpwbGF0Zm9ybSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJy
dXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKcGxhdGZv
cm0gYnVzQGYwMDAwOiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9s
bGVyQDE4MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2CnBsYXRmb3JtIGJ1c0BmMDAw
MDogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAw
IC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgotLS0tLSBjeWNsZTogc3RhcnQgLS0tLS0KL2J1
c0BmMDAwMC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMDogY3ljbGU6IGRlcGVuZHMg
b24gL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhAM2YvY29ubmVjdG9yCi9idXNA
ZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nvbm5lY3RvcjogY3ljbGU6IGRlcGVu
ZHMgb24gL2J1c0BmMDAwMC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMAotLS0tLSBj
eWNsZTogZW5kIC0tLS0tCi9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nv
bm5lY3RvcjogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRoIC9idXNAZjAwMDAvZHdj
My11c2JAZjkwMDAwMC91c2JAMzEwMDAwMDAKcGxhdGZvcm0gYnVzQGYwMDAwOiBOb3QgbGlu
a2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBtaWdodCBu
ZXZlciBiZWNvbWUgZGV2Ci0tLS0tIGN5Y2xlOiBzdGFydCAtLS0tLQovYnVzQGYwMDAwL2Rz
c0AzMDIwMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAv
YnJpZGdlLWhkbWlAM2IKL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2I6
IGN5Y2xlOiBkZXBlbmRzIG9uIC9idXNAZjAwMDAvZHNzQDMwMjAwMDAwCi0tLS0tIGN5Y2xl
OiBlbmQgLS0tLS0KL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2I6IEZp
eGVkIGRlcGVuZGVuY3kgY3ljbGUocykgd2l0aCAvYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMApw
bGF0Zm9ybSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNv
bnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKcGxhdGZvcm0gYnVz
QGYwMDAwOiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4
MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2CnBsYXRmb3JtIGJ1c0BmMDAwMDogTm90
IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWln
aHQgbmV2ZXIgYmVjb21lIGRldgpwbGF0Zm9ybSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9i
dXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJl
Y29tZSBkZXYKLS0tLS0gY3ljbGU6IHN0YXJ0IC0tLS0tCi9idXNAZjAwMDAvaTJjQDIwMDAw
MDAwL3RwczY1OTh4QDNmL2Nvbm5lY3RvcjogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAw
MC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMAovYnVzQGYwMDAwL2R3YzMtdXNiQGY5
MDAwMDAvdXNiQDMxMDAwMDAwOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYwMDAwL2kyY0Ay
MDAwMDAwMC90cHM2NTk4eEAzZi9jb25uZWN0b3IKLS0tLS0gY3ljbGU6IGVuZCAtLS0tLQov
YnVzQGYwMDAwL2R3YzMtdXNiQGY5MDAwMDAvdXNiQDMxMDAwMDAwOiBGaXhlZCBkZXBlbmRl
bmN5IGN5Y2xlKHMpIHdpdGggL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhAM2Yv
Y29ubmVjdG9yCnBsYXRmb3JtIGJ1c0BmMDAwMDogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9p
bnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgpw
bGF0Zm9ybSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNv
bnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKcGxhdGZvcm0gYnVz
QGYwMDAwOiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4
MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2CnBsYXRmb3JtIGJ1c0BmMDAwMDogTm90
IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWln
aHQgbmV2ZXIgYmVjb21lIGRldgpwbGF0Zm9ybSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9i
dXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJl
Y29tZSBkZXYKLS0tLS0gY3ljbGU6IHN0YXJ0IC0tLS0tCi9idXNAZjAwMDAvaTJjQDIwMDEw
MDAwL2JyaWRnZS1oZG1pQDNiOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYwMDAwL2Rzc0Az
MDIwMDAwMAovYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1
c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2IKLS0tLS0gY3ljbGU6IGVuZCAt
LS0tLQovYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMDogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShz
KSB3aXRoIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiCnBsYXRmb3Jt
IGJ1c0BmMDAwMDogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxl
ckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgpwbGF0Zm9ybSBidXNAZjAwMDA6
IE5vdCBsaW5raW5nIC9jbG9jay1kaXZpZGVyLW9sZGkgLSBtaWdodCBuZXZlciBiZWNvbWUg
ZGV2CnBsYXRmb3JtIGJ1c0BmMDAwMDogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1
cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgpwbGF0Zm9y
bSBidXNAZjAwMDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xs
ZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKZGV2aWNlOiAnYnVzQGYwMDAw
OmJ1c0A0MDAwMDAwJzogZGV2aWNlX2FkZApkZXZpY2U6ICc0MDg0MDAwLnBpbmN0cmwnOiBk
ZXZpY2VfYWRkCmRldmljZTogJzQxMDAwMDAuZXNtJzogZGV2aWNlX2FkZApkZXZpY2U6ICdi
dXNAZjAwMDA6YnVzQGIwMDAwMCc6IGRldmljZV9hZGQKcGxhdGZvcm0gYnVzQGYwMDAwOmJ1
c0BiMDAwMDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJA
MTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKZGV2aWNlOiAnNDMwMDAwMDAuc3lz
Y29uJzogZGV2aWNlX2FkZApkZXZpY2U6ICc0MzAwMDAxNC5jaGlwaWQnOiBkZXZpY2VfYWRk
CmRldmljZTogJzQzMDAwMjAwLmV0aGVybmV0LW1hYy1zeXNjb24nOiBkZXZpY2VfYWRkCmRl
dmljZTogJzQzMDA0MDA4LnN5c2Nvbic6IGRldmljZV9hZGQKZGV2aWNlOiAnNDMwMDQwMTgu
c3lzY29uJzogZGV2aWNlX2FkZApkZXZpY2U6ICcyYjMwMDA1MC50YXJnZXQtbW9kdWxlJzog
ZGV2aWNlX2FkZApkZXZpY2U6ICcyYjFmMDAwMC5ydGMnOiBkZXZpY2VfYWRkCnBsYXRmb3Jt
IDJiMWYwMDAwLnJ0YzogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJv
bGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgovYnVzQGYwMDAwL2J1c0Bi
MDAwMDAvcnRjQDJiMWYwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYw
MDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKZGV2aWNlOiAnYjAwMDAwLnRlbXBl
cmF0dXJlLXNlbnNvcic6IGRldmljZV9hZGQKZGV2aWNlOiAnNzAwMDAwMDAuc3JhbSc6IGRl
dmljZV9hZGQKZGV2aWNlOiAnYnVzQGYwMDAwOmJ1c0AxMDAwMDAnOiBkZXZpY2VfYWRkCmRl
dmljZTogJzEwNDA0NC5waHknOiBkZXZpY2VfYWRkCmRldmljZTogJzEwNDEzMC5jbG9jay1j
b250cm9sbGVyJzogZGV2aWNlX2FkZApkZXZpY2U6ICcxMDgyZTAuY2xvY2stY29udHJvbGxl
cic6IGRldmljZV9hZGQKZGV2aWNlOiAnMTA4MmU0LmNsb2NrLWNvbnRyb2xsZXInOiBkZXZp
Y2VfYWRkCmRldmljZTogJ2J1c0BmMDAwMDpidXNANDgwMDAwMDAnOiBkZXZpY2VfYWRkCnBs
YXRmb3JtIGJ1c0BmMDAwMDpidXNANDgwMDAwMDA6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAv
aW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYK
cGxhdGZvcm0gYnVzQGYwMDAwOmJ1c0A0ODAwMDAwMDogTm90IGxpbmtpbmcgL2J1c0BmMDAw
MC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRl
dgpkZXZpY2U6ICc0ZDAwMDAwMC5tYWlsYm94JzogZGV2aWNlX2FkZApwbGF0Zm9ybSA0ZDAw
MDAwMC5tYWlsYm94OiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9s
bGVyQDE4MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2Ci9idXNAZjAwMDAvYnVzQDQ4
MDAwMDAwL21haWxib3hANGQwMDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9i
dXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMApkZXZpY2U6ICc0ODAwMDAw
MC5pbnRlcnJ1cHQtY29udHJvbGxlcic6IGRldmljZV9hZGQKcGxhdGZvcm0gNDgwMDAwMDAu
aW50ZXJydXB0LWNvbnRyb2xsZXI6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0
LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAw
MC9idXNANDgwMDAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJANDgwMDAwMDAgRHJvcHBpbmcg
dGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgw
MDAwMApkZXZpY2U6ICc0ODVjMDEwMC5kbWEtY29udHJvbGxlcic6IGRldmljZV9hZGQKZGV2
aWNlOiAncGxhdGZvcm06NDgwMDAwMDAuaW50ZXJydXB0LWNvbnRyb2xsZXItLXBsYXRmb3Jt
OjQ4NWMwMTAwLmRtYS1jb250cm9sbGVyJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1v
dmluZyA0ODVjMDEwMC5kbWEtY29udHJvbGxlciB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSA0
ODVjMDEwMC5kbWEtY29udHJvbGxlcjogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDgwMDAw
MDAuaW50ZXJydXB0LWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9idXNANDgwMDAwMDAvZG1hLWNv
bnRyb2xsZXJANDg1YzAxMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAw
MDAvYnVzQDQ4MDAwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDQ4MDAwMDAwCmRldmljZTog
JzQ4NWMwMDAwLmRtYS1jb250cm9sbGVyJzogZGV2aWNlX2FkZApkZXZpY2U6ICdwbGF0Zm9y
bTo0ODAwMDAwMC5pbnRlcnJ1cHQtY29udHJvbGxlci0tcGxhdGZvcm06NDg1YzAwMDAuZG1h
LWNvbnRyb2xsZXInOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDQ4NWMwMDAw
LmRtYS1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDQ4NWMwMDAwLmRtYS1j
b250cm9sbGVyOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0ODAwMDAwMC5pbnRlcnJ1cHQt
Y29udHJvbGxlcgovYnVzQGYwMDAwL2J1c0A0ODAwMDAwMC9kbWEtY29udHJvbGxlckA0ODVj
MDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9idXNANDgwMDAw
MDAvaW50ZXJydXB0LWNvbnRyb2xsZXJANDgwMDAwMDAKZGV2aWNlOiAnNDQwNDMwMDAuc3lz
dGVtLWNvbnRyb2xsZXInOiBkZXZpY2VfYWRkCmRldmljZTogJ3BsYXRmb3JtOjRkMDAwMDAw
Lm1haWxib3gtLXBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyJzogZGV2aWNl
X2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlciB0
byBlbmQgb2YgbGlzdApwbGF0Zm9ybSA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjogTGlu
a2VkIGFzIGEgY29uc3VtZXIgdG8gNGQwMDAwMDAubWFpbGJveAovYnVzQGYwMDAwL3N5c3Rl
bS1jb250cm9sbGVyQDQ0MDQzMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVz
QGYwMDAwL2J1c0A0ODAwMDAwMC9tYWlsYm94QDRkMDAwMDAwCmRldmljZTogJzQwOTAwMDAw
LmNyeXB0byc6IGRldmljZV9hZGQKZGV2aWNlOiAnZjQwMDAucGluY3RybCc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnNDIwMDAwLmVzbSc6IGRldmljZV9hZGQKZGV2aWNlOiAnMjQwMDAwMC50
aW1lcic6IGRldmljZV9hZGQKcGxhdGZvcm0gMjQwMDAwMC50aW1lcjogTm90IGxpbmtpbmcg
L2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIg
YmVjb21lIGRldgovYnVzQGYwMDAwL3RpbWVyQDI0MDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9k
ZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMApkZXZp
Y2U6ICcyNDEwMDAwLnRpbWVyJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAyNDEwMDAwLnRpbWVy
OiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAg
LSBtaWdodCBuZXZlciBiZWNvbWUgZGV2Ci9idXNAZjAwMDAvdGltZXJAMjQxMDAwMCBEcm9w
cGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxl
ckAxODAwMDAwCmRldmljZTogJzI0MjAwMDAudGltZXInOiBkZXZpY2VfYWRkCnBsYXRmb3Jt
IDI0MjAwMDAudGltZXI6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRy
b2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAwMC90aW1l
ckAyNDIwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVy
cnVwdC1jb250cm9sbGVyQDE4MDAwMDAKZGV2aWNlOiAnMjQzMDAwMC50aW1lcic6IGRldmlj
ZV9hZGQKcGxhdGZvcm0gMjQzMDAwMC50aW1lcjogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9p
bnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgov
YnVzQGYwMDAwL3RpbWVyQDI0MzAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9i
dXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMApkZXZpY2U6ICcyNDQwMDAw
LnRpbWVyJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAyNDQwMDAwLnRpbWVyOiBOb3QgbGlua2lu
ZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBtaWdodCBuZXZl
ciBiZWNvbWUgZGV2Ci9idXNAZjAwMDAvdGltZXJAMjQ0MDAwMCBEcm9wcGluZyB0aGUgZndu
b2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCmRl
dmljZTogJzI0NTAwMDAudGltZXInOiBkZXZpY2VfYWRkCnBsYXRmb3JtIDI0NTAwMDAudGlt
ZXI6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAw
MCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAwMC90aW1lckAyNDUwMDAwIERy
b3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9s
bGVyQDE4MDAwMDAKZGV2aWNlOiAnMjQ2MDAwMC50aW1lcic6IGRldmljZV9hZGQKcGxhdGZv
cm0gMjQ2MDAwMC50aW1lcjogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29u
dHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgovYnVzQGYwMDAwL3Rp
bWVyQDI0NjAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50
ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMApkZXZpY2U6ICcyNDcwMDAwLnRpbWVyJzogZGV2
aWNlX2FkZApwbGF0Zm9ybSAyNDcwMDAwLnRpbWVyOiBOb3QgbGlua2luZyAvYnVzQGYwMDAw
L2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2
Ci9idXNAZjAwMDAvdGltZXJAMjQ3MDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8g
L2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwCmRldmljZTogJzI4MDAw
MDAuc2VyaWFsJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAyODAwMDAwLnNlcmlhbDogTm90IGxp
bmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQg
bmV2ZXIgYmVjb21lIGRldgovYnVzQGYwMDAwL3NlcmlhbEAyODAwMDAwIERyb3BwaW5nIHRo
ZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAw
MDAKZGV2aWNlOiAnMjAwMDAwMDAuaTJjJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAyMDAwMDAw
MC5pMmM6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgw
MDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAg
RHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRy
b2xsZXJAMTgwMDAwMAotLS0tLSBjeWNsZTogc3RhcnQgLS0tLS0KL2J1c0BmMDAwMC9kd2Mz
LXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAw
MC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhAM2YvY29ubmVjdG9yCi9idXNAZjAwMDAvaTJjQDIw
MDAwMDAwL3RwczY1OTh4QDNmL2Nvbm5lY3RvcjogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0Bm
MDAwMC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMAotLS0tLSBjeWNsZTogZW5kIC0t
LS0tCi9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nvbm5lY3RvcjogRml4
ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRoIC9idXNAZjAwMDAvZHdjMy11c2JAZjkwMDAw
MC91c2JAMzEwMDAwMDAKZGV2aWNlOiAnMjAwMTAwMDAuaTJjJzogZGV2aWNlX2FkZApwbGF0
Zm9ybSAyMDAxMDAwMC5pMmM6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNv
bnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAwMC9p
MmNAMjAwMTAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50
ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMAotLS0tLSBjeWNsZTogc3RhcnQgLS0tLS0KL2J1
c0BmMDAwMC9kc3NAMzAyMDAwMDA6IGN5Y2xlOiBkZXBlbmRzIG9uIC9idXNAZjAwMDAvaTJj
QDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRn
ZS1oZG1pQDNiOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMAot
LS0tLSBjeWNsZTogZW5kIC0tLS0tCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1o
ZG1pQDNiOiBGaXhlZCBkZXBlbmRlbmN5IGN5Y2xlKHMpIHdpdGggL2J1c0BmMDAwMC9kc3NA
MzAyMDAwMDAKZGV2aWNlOiAnMjAwMjAwMDAuaTJjJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAy
MDAyMDAwMC5pMmM6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xs
ZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAwMC9pMmNAMjAw
MjAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0
LWNvbnRyb2xsZXJAMTgwMDAwMApkZXZpY2U6ICdidXNAZjAwMDA6aW50ZXJydXB0LWNvbnRy
b2xsZXJAYTAwMDAwJzogZGV2aWNlX2FkZApwbGF0Zm9ybSBidXNAZjAwMDA6aW50ZXJydXB0
LWNvbnRyb2xsZXJAYTAwMDAwOiBOb3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1j
b250cm9sbGVyQDE4MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2Ci9idXNAZjAwMDAv
aW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0
byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKZGV2aWNlOiAnNjAw
MDAwLmdwaW8nOiBkZXZpY2VfYWRkCmRldmljZTogJ3BsYXRmb3JtOmJ1c0BmMDAwMDppbnRl
cnJ1cHQtY29udHJvbGxlckBhMDAwMDAtLXBsYXRmb3JtOjYwMDAwMC5ncGlvJzogZGV2aWNl
X2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyA2MDAwMDAuZ3BpbyB0byBlbmQgb2YgbGlzdApw
bGF0Zm9ybSA2MDAwMDAuZ3BpbzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gYnVzQGYwMDAw
OmludGVycnVwdC1jb250cm9sbGVyQGEwMDAwMAovYnVzQGYwMDAwL2dwaW9ANjAwMDAwIERy
b3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9s
bGVyQGEwMDAwMApwbGF0Zm9ybSA2MDAwMDAuZ3BpbzogZXJyb3IgLUVQUk9CRV9ERUZFUjog
d2FpdCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAw
MC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJzYwMTAwMC5ncGlvJzogZGV2aWNlX2FkZApk
ZXZpY2U6ICdwbGF0Zm9ybTo2MDEwMDAuZ3Bpby0tcGxhdGZvcm06MjAwMTAwMDAuaTJjJzog
ZGV2aWNlX2FkZApwbGF0Zm9ybSAyMDAxMDAwMC5pMmM6IExpbmtlZCBhcyBhIHN5bmMgc3Rh
dGUgb25seSBjb25zdW1lciB0byA2MDEwMDAuZ3BpbyAoZmxhZ3MgMHgxYzApCmRldmljZTog
J3BsYXRmb3JtOmJ1c0BmMDAwMDppbnRlcnJ1cHQtY29udHJvbGxlckBhMDAwMDAtLXBsYXRm
b3JtOjYwMTAwMC5ncGlvJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyA2MDEw
MDAuZ3BpbyB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSA2MDEwMDAuZ3BpbzogTGlua2VkIGFz
IGEgY29uc3VtZXIgdG8gYnVzQGYwMDAwOmludGVycnVwdC1jb250cm9sbGVyQGEwMDAwMAov
YnVzQGYwMDAwL2dwaW9ANjAxMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVz
QGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQGEwMDAwMApwbGF0Zm9ybSA2MDEwMDAuZ3Bp
bzogZXJyb3IgLUVQUk9CRV9ERUZFUjogd2FpdCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9z
eXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ2Zh
MTAwMDAubW1jJzogZGV2aWNlX2FkZApwbGF0Zm9ybSBmYTEwMDAwLm1tYzogTm90IGxpbmtp
bmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2
ZXIgYmVjb21lIGRldgovYnVzQGYwMDAwL21tY0BmYTEwMDAwIERyb3BwaW5nIHRoZSBmd25v
ZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAKZGV2
aWNlOiAnZmEwMDAwMC5tbWMnOiBkZXZpY2VfYWRkCnBsYXRmb3JtIGZhMDAwMDAubW1jOiBO
b3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBt
aWdodCBuZXZlciBiZWNvbWUgZGV2Ci9idXNAZjAwMDAvbW1jQGZhMDAwMDAgRHJvcHBpbmcg
dGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgw
MDAwMApkZXZpY2U6ICdmOTAwMDAwLmR3YzMtdXNiJzogZGV2aWNlX2FkZAotLS0tLSBjeWNs
ZTogc3RhcnQgLS0tLS0KL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhAM2YvY29u
bmVjdG9yOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYwMDAwL2R3YzMtdXNiQGY5MDAwMDAv
dXNiQDMxMDAwMDAwCi9idXNAZjAwMDAvZHdjMy11c2JAZjkwMDAwMC91c2JAMzEwMDAwMDA6
IGN5Y2xlOiBkZXBlbmRzIG9uIC9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNm
L2Nvbm5lY3RvcgotLS0tLSBjeWNsZTogZW5kIC0tLS0tCi9idXNAZjAwMDAvZHdjMy11c2JA
ZjkwMDAwMC91c2JAMzEwMDAwMDA6IEZpeGVkIGRlcGVuZGVuY3kgY3ljbGUocykgd2l0aCAv
YnVzQGYwMDAwL2kyY0AyMDAwMDAwMC90cHM2NTk4eEAzZi9jb25uZWN0b3IKcGxhdGZvcm0g
ZjkwMDAwMC5kd2MzLXVzYjogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29u
dHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgpkZXZpY2U6ICdmOTEw
MDAwLmR3YzMtdXNiJzogZGV2aWNlX2FkZApwbGF0Zm9ybSBmOTEwMDAwLmR3YzMtdXNiOiBO
b3QgbGlua2luZyAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBt
aWdodCBuZXZlciBiZWNvbWUgZGV2CmRldmljZTogJ2ZjMDAwMDAuYnVzJzogZGV2aWNlX2Fk
ZApwbGF0Zm9ybSBmYzAwMDAwLmJ1czogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1
cHQtY29udHJvbGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgpkZXZpY2U6
ICdmYzQwMDAwLnNwaSc6IGRldmljZV9hZGQKcGxhdGZvcm0gZmM0MDAwMC5zcGk6IE5vdCBs
aW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0
IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAwMC9idXNAZmMwMDAwMC9zcGlAZmM0MDAwMCBE
cm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJv
bGxlckAxODAwMDAwCmRldmljZTogJ2ZkMDAwMDAuZ3B1JzogZGV2aWNlX2FkZApwbGF0Zm9y
bSBmZDAwMDAwLmdwdTogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJv
bGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgovYnVzQGYwMDAwL2dwdUBm
ZDAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVw
dC1jb250cm9sbGVyQDE4MDAwMDAKZGV2aWNlOiAnODAwMDAwMC5ldGhlcm5ldCc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAncGxhdGZvcm06MTA0MDQ0LnBoeS0tcGxhdGZvcm06ODAwMDAwMC5l
dGhlcm5ldCc6IGRldmljZV9hZGQKcGxhdGZvcm0gODAwMDAwMC5ldGhlcm5ldDogTGlua2Vk
IGFzIGEgc3luYyBzdGF0ZSBvbmx5IGNvbnN1bWVyIHRvIDEwNDA0NC5waHkgKGZsYWdzIDB4
MWMwKQpwbGF0Zm9ybSA4MDAwMDAwLmV0aGVybmV0OiBOb3QgbGlua2luZyAvYnVzQGYwMDAw
L2ludGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2
CmRldmljZTogJzMwMjAwMDAwLmRzcyc6IGRldmljZV9hZGQKLS0tLS0gY3ljbGU6IHN0YXJ0
IC0tLS0tCi9idXNAZjAwMDAvZHNzQDMwMjAwMDAwOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVz
QGYwMDAwL2kyY0AyMDAxMDAwMC9icmlkZ2UtaGRtaUAzYgovYnVzQGYwMDAwL2kyY0AyMDAx
MDAwMC9icmlkZ2UtaGRtaUAzYjogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAwMC9kc3NA
MzAyMDAwMDAKLS0tLS0gY3ljbGU6IGVuZCAtLS0tLQovYnVzQGYwMDAwL2kyY0AyMDAxMDAw
MC9icmlkZ2UtaGRtaUAzYjogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRoIC9idXNA
ZjAwMDAvZHNzQDMwMjAwMDAwCmRldmljZTogJ3BsYXRmb3JtOjMwMjAwMDAwLmRzcy0tcGxh
dGZvcm06MjAwMTAwMDAuaTJjJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAyMDAxMDAwMC5pMmM6
IExpbmtlZCBhcyBhIHN5bmMgc3RhdGUgb25seSBjb25zdW1lciB0byAzMDIwMDAwMC5kc3Mg
KGZsYWdzIDB4M2MwKQotLS0tLSBjeWNsZTogc3RhcnQgLS0tLS0KL2J1c0BmMDAwMC9pMmNA
MjAwMTAwMDAvYnJpZGdlLWhkbWlAM2I6IGN5Y2xlOiBkZXBlbmRzIG9uIC9idXNAZjAwMDAv
ZHNzQDMwMjAwMDAwCi0tLS0tIGN5Y2xlOiBzdGFydCAtLS0tLQovYnVzQGYwMDAwL2kyY0Ay
MDAxMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAwMC9kc3NAMzAyMDAwMDAKL2J1
c0BmMDAwMC9pMmNAMjAwMTAwMDAvZ3Bpb0AyMjogY3ljbGU6IGNoaWxkIG9mIC9idXNAZjAw
MDAvaTJjQDIwMDEwMDAwCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNi
OiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyCi0t
LS0tIGN5Y2xlOiBzdGFydCAtLS0tLQovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMDogY3ljbGU6
IGRlcGVuZHMgb24gL2J1c0BmMDAwMC9kc3NAMzAyMDAwMDAKL2J1c0BmMDAwMC9pMmNAMjAw
MTAwMDAvYnJpZGdlLWhkbWlAM2I6IGN5Y2xlOiBjaGlsZCBvZiAvYnVzQGYwMDAwL2kyY0Ay
MDAxMDAwMAovYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1
c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2IKLS0tLS0gY3ljbGU6IGVuZCAt
LS0tLQovYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMDogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShz
KSB3aXRoIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiCnBsYXRmb3Jt
IDMwMjAwMDAwLmRzczogTm90IGxpbmtpbmcgL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJv
bGxlckAxODAwMDAwIC0gbWlnaHQgbmV2ZXIgYmVjb21lIGRldgovYnVzQGYwMDAwL2Rzc0Az
MDIwMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9pbnRlcnJ1
cHQtY29udHJvbGxlckAxODAwMDAwCnBsYXRmb3JtIDMwMjAwMDAwLmRzczogTm90IGxpbmtp
bmcgL2Nsb2NrLWRpdmlkZXItb2xkaSAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0Bm
MDAwMC9kc3NAMzAyMDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9jbG9jay1k
aXZpZGVyLW9sZGkKZGV2aWNlOiAnMmEwMDAwMDAuc3BpbmxvY2snOiBkZXZpY2VfYWRkCmRl
dmljZTogJzI5MDAwMDAwLm1haWxib3gnOiBkZXZpY2VfYWRkCnBsYXRmb3JtIDI5MDAwMDAw
Lm1haWxib3g6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJA
MTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1c0BmMDAwMC9tYWlsYm94QDI5
MDAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVw
dC1jb250cm9sbGVyQDE4MDAwMDAKZGV2aWNlOiAnZTAwMDAwMC53YXRjaGRvZyc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAnZTAxMDAwMC53YXRjaGRvZyc6IGRldmljZV9hZGQKZGV2aWNlOiAn
ZTAyMDAwMC53YXRjaGRvZyc6IGRldmljZV9hZGQKZGV2aWNlOiAnZTAzMDAwMC53YXRjaGRv
Zyc6IGRldmljZV9hZGQKZGV2aWNlOiAnZTBmMDAwMC53YXRjaGRvZyc6IGRldmljZV9hZGQK
ZGV2aWNlOiAnMmIxMDAwMC5hdWRpby1jb250cm9sbGVyJzogZGV2aWNlX2FkZApwbGF0Zm9y
bSAyYjEwMDAwLmF1ZGlvLWNvbnRyb2xsZXI6IE5vdCBsaW5raW5nIC9idXNAZjAwMDAvaW50
ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMCAtIG1pZ2h0IG5ldmVyIGJlY29tZSBkZXYKL2J1
c0BmMDAwMC9hdWRpby1jb250cm9sbGVyQDJiMTAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBs
aW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMApkZXZpY2U6
ICdvcHAtdGFibGUnOiBkZXZpY2VfYWRkCmRldmljZTogJ2wyLWNhY2hlMCc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbGVkcyc6IGRldmljZV9hZGQKL2xlZHMgTGlua2VkIGFzIGEgZndub2Rl
IGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMC91c3ItbGVkLWRlZmF1bHQt
cGlucwovbGVkcy9sZWQtMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0Bm
MDAwMC9ncGlvQDYwMTAwMApkZXZpY2U6ICdwbGF0Zm9ybTo2MDEwMDAuZ3Bpby0tcGxhdGZv
cm06bGVkcyc6IGRldmljZV9hZGQKcGxhdGZvcm0gbGVkczogTGlua2VkIGFzIGEgc3luYyBz
dGF0ZSBvbmx5IGNvbnN1bWVyIHRvIDYwMTAwMC5ncGlvIChmbGFncyAweDFjMCkKZGV2aWNl
OiAnc291bmQnOiBkZXZpY2VfYWRkCi9zb3VuZC9zaW1wbGUtYXVkaW8tY2FyZCxjb2RlYyBM
aW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2Nsay0wCnBsYXRmb3JtIHNvdW5kOiBO
b3QgbGlua2luZyAvY2xrLTAgLSBtaWdodCBuZXZlciBiZWNvbWUgZGV2CmRldmljZTogJ2Nv
bm5lY3Rvci1oZG1pJzogZGV2aWNlX2FkZAovY29ubmVjdG9yLWhkbWkgTGlua2VkIGFzIGEg
Zndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1p
QDNiCi0tLS0tIGN5Y2xlOiBzdGFydCAtLS0tLQovY29ubmVjdG9yLWhkbWk6IGN5Y2xlOiBk
ZXBlbmRzIG9uIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiCi9idXNA
ZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiOiBjeWNsZTogZGVwZW5kcyBvbiAv
Y29ubmVjdG9yLWhkbWkKLS0tLS0gY3ljbGU6IGVuZCAtLS0tLQovYnVzQGYwMDAwL2kyY0Ay
MDAxMDAwMC9icmlkZ2UtaGRtaUAzYjogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRo
IC9jb25uZWN0b3ItaGRtaQpkZXZpY2U6ICdwbGF0Zm9ybTpjb25uZWN0b3ItaGRtaS0tcGxh
dGZvcm06MjAwMTAwMDAuaTJjJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAyMDAxMDAwMC5pMmM6
IExpbmtlZCBhcyBhIHN5bmMgc3RhdGUgb25seSBjb25zdW1lciB0byBjb25uZWN0b3ItaGRt
aSAoZmxhZ3MgMHgzYzApCi0tLS0tIGN5Y2xlOiBzdGFydCAtLS0tLQovYnVzQGYwMDAwL2ky
Y0AyMDAxMDAwMC9icmlkZ2UtaGRtaUAzYjogY3ljbGU6IGRlcGVuZHMgb24gL2Nvbm5lY3Rv
ci1oZG1pCi0tLS0tIGN5Y2xlOiBzdGFydCAtLS0tLQovYnVzQGYwMDAwL2kyY0AyMDAxMDAw
MDogY3ljbGU6IGRlcGVuZHMgb24gL2Nvbm5lY3Rvci1oZG1pCi9idXNAZjAwMDAvaTJjQDIw
MDEwMDAwL2dwaW9AMjI6IGN5Y2xlOiBjaGlsZCBvZiAvYnVzQGYwMDAwL2kyY0AyMDAxMDAw
MAovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9icmlkZ2UtaGRtaUAzYjogY3ljbGU6IGRlcGVu
ZHMgb24gL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvZ3Bpb0AyMgotLS0tLSBjeWNsZTogc3Rh
cnQgLS0tLS0KL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDA6IGN5Y2xlOiBkZXBlbmRzIG9uIC9j
b25uZWN0b3ItaGRtaQovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9icmlkZ2UtaGRtaUAzYjog
Y3ljbGU6IGNoaWxkIG9mIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwCi9jb25uZWN0b3ItaGRt
aTogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhk
bWlAM2IKLS0tLS0gY3ljbGU6IGVuZCAtLS0tLQovY29ubmVjdG9yLWhkbWk6IEZpeGVkIGRl
cGVuZGVuY3kgY3ljbGUocykgd2l0aCAvYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9icmlkZ2Ut
aGRtaUAzYgpkZXZpY2U6ICdyZWd1bGF0b3ItMCc6IGRldmljZV9hZGQKZGV2aWNlOiAncmVn
dWxhdG9yLTEnOiBkZXZpY2VfYWRkCi9yZWd1bGF0b3ItMSBMaW5rZWQgYXMgYSBmd25vZGUg
Y29uc3VtZXIgdG8gL3JlZ3VsYXRvci0wCmRldmljZTogJ3BsYXRmb3JtOnJlZ3VsYXRvci0w
LS1wbGF0Zm9ybTpyZWd1bGF0b3ItMSc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgcmVndWxhdG9yLTEgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gcmVndWxhdG9yLTE6IExp
bmtlZCBhcyBhIGNvbnN1bWVyIHRvIHJlZ3VsYXRvci0wCi9yZWd1bGF0b3ItMSBEcm9wcGlu
ZyB0aGUgZndub2RlIGxpbmsgdG8gL3JlZ3VsYXRvci0wCmRldmljZTogJ3JlZ3VsYXRvci0y
JzogZGV2aWNlX2FkZAovcmVndWxhdG9yLTIgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVy
IHRvIC9yZWd1bGF0b3ItMApkZXZpY2U6ICdwbGF0Zm9ybTpyZWd1bGF0b3ItMi0tcGxhdGZv
cm06MjAwMTAwMDAuaTJjJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAyMDAxMDAwMC5pMmM6IExp
bmtlZCBhcyBhIHN5bmMgc3RhdGUgb25seSBjb25zdW1lciB0byByZWd1bGF0b3ItMiAoZmxh
Z3MgMHgxYzApCmRldmljZTogJ3BsYXRmb3JtOnJlZ3VsYXRvci0wLS1wbGF0Zm9ybTpyZWd1
bGF0b3ItMic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTIg
dG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gcmVndWxhdG9yLTI6IExpbmtlZCBhcyBhIGNvbnN1
bWVyIHRvIHJlZ3VsYXRvci0wCi9yZWd1bGF0b3ItMiBEcm9wcGluZyB0aGUgZndub2RlIGxp
bmsgdG8gL3JlZ3VsYXRvci0wCmRldmljZTogJ3JlZ3VsYXRvci0zJzogZGV2aWNlX2FkZAov
cmVndWxhdG9yLTMgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9yZWd1bGF0b3It
MgovcmVndWxhdG9yLTMgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAw
MDAvaTJjQDIwMDEwMDAwL2dwaW9AMjIKZGV2aWNlOiAncGxhdGZvcm06cmVndWxhdG9yLTMt
LXBsYXRmb3JtOmZhMDAwMDAubW1jJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmlu
ZyBmYTAwMDAwLm1tYyB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSBmYTAwMDAwLm1tYzogTGlu
a2VkIGFzIGEgY29uc3VtZXIgdG8gcmVndWxhdG9yLTMKL2J1c0BmMDAwMC9tbWNAZmEwMDAw
MCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL3JlZ3VsYXRvci0zCmRldmljZTogJ3Bs
YXRmb3JtOnJlZ3VsYXRvci0yLS1wbGF0Zm9ybTpyZWd1bGF0b3ItMyc6IGRldmljZV9hZGQK
ZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTMgdG8gZW5kIG9mIGxpc3QKZGV2aWNl
c19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gcmVn
dWxhdG9yLTM6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIHJlZ3VsYXRvci0yCi9yZWd1bGF0
b3ItMyBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL3JlZ3VsYXRvci0yCmRldmljZTog
J3JlZ3VsYXRvci00JzogZGV2aWNlX2FkZAovcmVndWxhdG9yLTQgTGlua2VkIGFzIGEgZndu
b2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMC92ZGQtc2QtZHYtZGVm
YXVsdC1waW5zCi9yZWd1bGF0b3ItNCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8g
L3JlZ3VsYXRvci0xCi9yZWd1bGF0b3ItNCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIg
dG8gL2J1c0BmMDAwMC9ncGlvQDYwMDAwMApkZXZpY2U6ICdwbGF0Zm9ybTpyZWd1bGF0b3It
NC0tcGxhdGZvcm06ZmEwMDAwMC5tbWMnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92
aW5nIGZhMDAwMDAubW1jIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGZhMDAwMDAubW1jOiBM
aW5rZWQgYXMgYSBjb25zdW1lciB0byByZWd1bGF0b3ItNAovYnVzQGYwMDAwL21tY0BmYTAw
MDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvcmVndWxhdG9yLTQKZGV2aWNlOiAn
cGxhdGZvcm06NjAwMDAwLmdwaW8tLXBsYXRmb3JtOnJlZ3VsYXRvci00JzogZGV2aWNlX2Fk
ZApkZXZpY2VzX2tzZXQ6IE1vdmluZyByZWd1bGF0b3ItNCB0byBlbmQgb2YgbGlzdApkZXZp
Y2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1tYyB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSBy
ZWd1bGF0b3ItNDogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNjAwMDAwLmdwaW8KL3JlZ3Vs
YXRvci00IERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2dwaW9ANjAw
MDAwCmRldmljZTogJ3BsYXRmb3JtOnJlZ3VsYXRvci0xLS1wbGF0Zm9ybTpyZWd1bGF0b3It
NCc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTQgdG8gZW5k
IG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxp
c3QKcGxhdGZvcm0gcmVndWxhdG9yLTQ6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIHJlZ3Vs
YXRvci0xCi9yZWd1bGF0b3ItNCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL3JlZ3Vs
YXRvci0xCmRldmljZTogJ3JlZ3VsYXRvci01JzogZGV2aWNlX2FkZAovcmVndWxhdG9yLTUg
TGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9yZWd1bGF0b3ItMgpkZXZpY2U6ICdw
bGF0Zm9ybTpyZWd1bGF0b3ItNS0tcGxhdGZvcm06MjAwMTAwMDAuaTJjJzogZGV2aWNlX2Fk
ZApwbGF0Zm9ybSAyMDAxMDAwMC5pMmM6IExpbmtlZCBhcyBhIHN5bmMgc3RhdGUgb25seSBj
b25zdW1lciB0byByZWd1bGF0b3ItNSAoZmxhZ3MgMHgxYzApCmRldmljZTogJ3BsYXRmb3Jt
OnJlZ3VsYXRvci0yLS1wbGF0Zm9ybTpyZWd1bGF0b3ItNSc6IGRldmljZV9hZGQKZGV2aWNl
c19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTUgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gcmVn
dWxhdG9yLTU6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIHJlZ3VsYXRvci0yCi9yZWd1bGF0
b3ItNSBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL3JlZ3VsYXRvci0yCmRldmljZTog
J3dyaXRlYmFjayc6IGRldmljZV9hZGQKSHVnZVRMQjogcmVnaXN0ZXJlZCAxLjAwIEdpQiBw
YWdlIHNpemUsIHByZS1hbGxvY2F0ZWQgMCBwYWdlcwpIdWdlVExCOiAwIEtpQiB2bWVtbWFw
IGNhbiBiZSBmcmVlZCBmb3IgYSAxLjAwIEdpQiBwYWdlCkh1Z2VUTEI6IHJlZ2lzdGVyZWQg
MzIuMCBNaUIgcGFnZSBzaXplLCBwcmUtYWxsb2NhdGVkIDAgcGFnZXMKSHVnZVRMQjogMCBL
aUIgdm1lbW1hcCBjYW4gYmUgZnJlZWQgZm9yIGEgMzIuMCBNaUIgcGFnZQpIdWdlVExCOiBy
ZWdpc3RlcmVkIDIuMDAgTWlCIHBhZ2Ugc2l6ZSwgcHJlLWFsbG9jYXRlZCAwIHBhZ2VzCkh1
Z2VUTEI6IDAgS2lCIHZtZW1tYXAgY2FuIGJlIGZyZWVkIGZvciBhIDIuMDAgTWlCIHBhZ2UK
SHVnZVRMQjogcmVnaXN0ZXJlZCA2NC4wIEtpQiBwYWdlIHNpemUsIHByZS1hbGxvY2F0ZWQg
MCBwYWdlcwpIdWdlVExCOiAwIEtpQiB2bWVtbWFwIGNhbiBiZSBmcmVlZCBmb3IgYSA2NC4w
IEtpQiBwYWdlCmRldmljZTogJ21lbW9yeV90aWVyaW5nJzogZGV2aWNlX2FkZApBQ1BJOiBJ
bnRlcnByZXRlciBkaXNhYmxlZC4KZGV2aWNlOiAnc29jMCc6IGRldmljZV9hZGQKazMtY2hp
cGluZm8gNDMwMDAwMTQuY2hpcGlkOiBGYW1pbHk6QU02MlggcmV2OlNSMS4wIEpUQUdJRFsw
eDBiYjdlMDJmXSBEZXRlY3RlZApwbGF0Zm9ybSByZWd1bGF0b3ItMTogZXJyb3IgLUVQUk9C
RV9ERUZFUjogc3VwcGxpZXIgcmVndWxhdG9yLTAgbm90IHJlYWR5CnBsYXRmb3JtIHJlZ3Vs
YXRvci0yOiBlcnJvciAtRVBST0JFX0RFRkVSOiBzdXBwbGllciByZWd1bGF0b3ItMCBub3Qg
cmVhZHkKcGxhdGZvcm0gcmVndWxhdG9yLTM6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQg
Zm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2dwaW9AMjIKZGV2aWNlOiAn
cmVndWxhdG9yLjEnOiBkZXZpY2VfYWRkCnBsYXRmb3JtIHJlZ3VsYXRvci01OiBlcnJvciAt
RVBST0JFX0RFRkVSOiBzdXBwbGllciByZWd1bGF0b3ItMiBub3QgcmVhZHkKcGxhdGZvcm0g
cmVndWxhdG9yLTQ6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9i
dXNAZjAwMDAvcGluY3RybEBmNDAwMC92ZGQtc2QtZHYtZGVmYXVsdC1waW5zCmlvbW11OiBE
ZWZhdWx0IGRvbWFpbiB0eXBlOiBUcmFuc2xhdGVkCmlvbW11OiBETUEgZG9tYWluIFRMQiBp
bnZhbGlkYXRpb24gcG9saWN5OiBzdHJpY3QgbW9kZQp1c2Jjb3JlOiByZWdpc3RlcmVkIG5l
dyBpbnRlcmZhY2UgZHJpdmVyIHVzYmZzCnVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGludGVy
ZmFjZSBkcml2ZXIgaHViCnVzYmNvcmU6IHJlZ2lzdGVyZWQgbmV3IGRldmljZSBkcml2ZXIg
dXNiCnBsYXRmb3JtIDIwMDAwMDAwLmkyYzogZXJyb3IgLUVQUk9CRV9ERUZFUjogd2FpdCBm
b3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwL21haW4taTJjMC1kZWZhdWx0
LXBpbnMKcGxhdGZvcm0gMjAwMTAwMDAuaTJjOiBlcnJvciAtRVBST0JFX0RFRkVSOiB3YWl0
IGZvciBzdXBwbGllciAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAvbWFpbi1pMmMxLWRlZmF1
bHQtcGlucwpwbGF0Zm9ybSAyMDAyMDAwMC5pMmM6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdh
aXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMC9tYWluLWkyYzItZGVm
YXVsdC1waW5zCnBwc19jb3JlOiBMaW51eFBQUyBBUEkgdmVyLiAxIHJlZ2lzdGVyZWQKcHBz
X2NvcmU6IFNvZnR3YXJlIHZlci4gNS4zLjYgLSBDb3B5cmlnaHQgMjAwNS0yMDA3IFJvZG9s
Zm8gR2lvbWV0dGkgPGdpb21ldHRpQGxpbnV4Lml0PgpQVFAgY2xvY2sgc3VwcG9ydCByZWdp
c3RlcmVkCkVEQUMgTUM6IFZlcjogMy4wLjAKZGV2aWNlOiAnZWRhYyc6IGRldmljZV9hZGQK
ZGV2aWNlOiAnbWMnOiBkZXZpY2VfYWRkCnNjbWlfY29yZTogU0NNSSBwcm90b2NvbCBidXMg
cmVnaXN0ZXJlZApGUEdBIG1hbmFnZXIgZnJhbWV3b3JrCkFkdmFuY2VkIExpbnV4IFNvdW5k
IEFyY2hpdGVjdHVyZSBEcml2ZXIgSW5pdGlhbGl6ZWQuCmRldmljZTogJ2xvJzogZGV2aWNl
X2FkZApjbG9ja3NvdXJjZTogU3dpdGNoZWQgdG8gY2xvY2tzb3VyY2UgYXJjaF9zeXNfY291
bnRlcgpWRlM6IERpc2sgcXVvdGFzIGRxdW90XzYuNi4wClZGUzogRHF1b3QtY2FjaGUgaGFz
aCB0YWJsZSBlbnRyaWVzOiA1MTIgKG9yZGVyIDAsIDQwOTYgYnl0ZXMpCnBucDogUG5QIEFD
UEk6IGRpc2FibGVkCmRldmljZTogJ21lbSc6IGRldmljZV9hZGQKZGV2aWNlOiAnbnVsbCc6
IGRldmljZV9hZGQKZGV2aWNlOiAncG9ydCc6IGRldmljZV9hZGQKZGV2aWNlOiAnemVybyc6
IGRldmljZV9hZGQKZGV2aWNlOiAnZnVsbCc6IGRldmljZV9hZGQKZGV2aWNlOiAncmFuZG9t
JzogZGV2aWNlX2FkZApkZXZpY2U6ICd1cmFuZG9tJzogZGV2aWNlX2FkZApkZXZpY2U6ICdr
bXNnJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHknOiBkZXZpY2VfYWRkCmRldmljZTogJ2Nv
bnNvbGUnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTAnOiBkZXZpY2VfYWRkCmRldmljZTog
J3Zjcyc6IGRldmljZV9hZGQKZGV2aWNlOiAndmNzdSc6IGRldmljZV9hZGQKZGV2aWNlOiAn
dmNzYSc6IGRldmljZV9hZGQKZGV2aWNlOiAndmNzMSc6IGRldmljZV9hZGQKZGV2aWNlOiAn
dmNzdTEnOiBkZXZpY2VfYWRkCmRldmljZTogJ3Zjc2ExJzogZGV2aWNlX2FkZApkZXZpY2U6
ICd0dHkxJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHkyJzogZGV2aWNlX2FkZApkZXZpY2U6
ICd0dHkzJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHk0JzogZGV2aWNlX2FkZApkZXZpY2U6
ICd0dHk1JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHk2JzogZGV2aWNlX2FkZApkZXZpY2U6
ICd0dHk3JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHk4JzogZGV2aWNlX2FkZApkZXZpY2U6
ICd0dHk5JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHkxMCc6IGRldmljZV9hZGQKZGV2aWNl
OiAndHR5MTEnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTEyJzogZGV2aWNlX2FkZApkZXZp
Y2U6ICd0dHkxMyc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5MTQnOiBkZXZpY2VfYWRkCmRl
dmljZTogJ3R0eTE1JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHkxNic6IGRldmljZV9hZGQK
ZGV2aWNlOiAndHR5MTcnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTE4JzogZGV2aWNlX2Fk
ZApkZXZpY2U6ICd0dHkxOSc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5MjAnOiBkZXZpY2Vf
YWRkCmRldmljZTogJ3R0eTIxJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHkyMic6IGRldmlj
ZV9hZGQKZGV2aWNlOiAndHR5MjMnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTI0JzogZGV2
aWNlX2FkZApkZXZpY2U6ICd0dHkyNSc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5MjYnOiBk
ZXZpY2VfYWRkCmRldmljZTogJ3R0eTI3JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHkyOCc6
IGRldmljZV9hZGQKZGV2aWNlOiAndHR5MjknOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTMw
JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHkzMSc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5
MzInOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTMzJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0
dHkzNCc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5MzUnOiBkZXZpY2VfYWRkCmRldmljZTog
J3R0eTM2JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHkzNyc6IGRldmljZV9hZGQKZGV2aWNl
OiAndHR5MzgnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTM5JzogZGV2aWNlX2FkZApkZXZp
Y2U6ICd0dHk0MCc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5NDEnOiBkZXZpY2VfYWRkCmRl
dmljZTogJ3R0eTQyJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHk0Myc6IGRldmljZV9hZGQK
ZGV2aWNlOiAndHR5NDQnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTQ1JzogZGV2aWNlX2Fk
ZApkZXZpY2U6ICd0dHk0Nic6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5NDcnOiBkZXZpY2Vf
YWRkCmRldmljZTogJ3R0eTQ4JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHk0OSc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAndHR5NTAnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTUxJzogZGV2
aWNlX2FkZApkZXZpY2U6ICd0dHk1Mic6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5NTMnOiBk
ZXZpY2VfYWRkCmRldmljZTogJ3R0eTU0JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHk1NSc6
IGRldmljZV9hZGQKZGV2aWNlOiAndHR5NTYnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTU3
JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHk1OCc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5
NTknOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eTYwJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0
dHk2MSc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5NjInOiBkZXZpY2VfYWRkCmRldmljZTog
J3R0eTYzJzogZGV2aWNlX2FkZApkZXZpY2U6ICdod19yYW5kb20nOiBkZXZpY2VfYWRkCk5F
VDogUmVnaXN0ZXJlZCBQRl9JTkVUIHByb3RvY29sIGZhbWlseQpJUCBpZGVudHMgaGFzaCB0
YWJsZSBlbnRyaWVzOiAzMjc2OCAob3JkZXI6IDYsIDI2MjE0NCBieXRlcywgbGluZWFyKQp0
Y3BfbGlzdGVuX3BvcnRhZGRyX2hhc2ggaGFzaCB0YWJsZSBlbnRyaWVzOiAxMDI0IChvcmRl
cjogNCwgNzM3MjggYnl0ZXMsIGxpbmVhcikKVGFibGUtcGVydHVyYiBoYXNoIHRhYmxlIGVu
dHJpZXM6IDY1NTM2IChvcmRlcjogNiwgMjYyMTQ0IGJ5dGVzLCBsaW5lYXIpClRDUCBlc3Rh
Ymxpc2hlZCBoYXNoIHRhYmxlIGVudHJpZXM6IDE2Mzg0IChvcmRlcjogNSwgMTMxMDcyIGJ5
dGVzLCBsaW5lYXIpClRDUCBiaW5kIGhhc2ggdGFibGUgZW50cmllczogMTYzODQgKG9yZGVy
OiA5LCAyMzU5Mjk2IGJ5dGVzLCBsaW5lYXIpClRDUDogSGFzaCB0YWJsZXMgY29uZmlndXJl
ZCAoZXN0YWJsaXNoZWQgMTYzODQgYmluZCAxNjM4NCkKVURQIGhhc2ggdGFibGUgZW50cmll
czogMTAyNCAob3JkZXI6IDUsIDE2Mzg0MCBieXRlcywgbGluZWFyKQpVRFAtTGl0ZSBoYXNo
IHRhYmxlIGVudHJpZXM6IDEwMjQgKG9yZGVyOiA1LCAxNjM4NDAgYnl0ZXMsIGxpbmVhcikK
TkVUOiBSZWdpc3RlcmVkIFBGX1VOSVgvUEZfTE9DQUwgcHJvdG9jb2wgZmFtaWx5ClJQQzog
UmVnaXN0ZXJlZCBuYW1lZCBVTklYIHNvY2tldCB0cmFuc3BvcnQgbW9kdWxlLgpSUEM6IFJl
Z2lzdGVyZWQgdWRwIHRyYW5zcG9ydCBtb2R1bGUuClJQQzogUmVnaXN0ZXJlZCB0Y3AgdHJh
bnNwb3J0IG1vZHVsZS4KUlBDOiBSZWdpc3RlcmVkIHRjcC13aXRoLXRscyB0cmFuc3BvcnQg
bW9kdWxlLgpSUEM6IFJlZ2lzdGVyZWQgdGNwIE5GU3Y0LjEgYmFja2NoYW5uZWwgdHJhbnNw
b3J0IG1vZHVsZS4KZGV2aWNlOiAnc25hcHNob3QnOiBkZXZpY2VfYWRkCmRldmljZTogJ2Ns
b2Nrc291cmNlJzogZGV2aWNlX2FkZApkZXZpY2U6ICdjbG9ja3NvdXJjZTAnOiBkZXZpY2Vf
YWRkCmRldmljZTogJ2Nsb2NrZXZlbnRzJzogZGV2aWNlX2FkZApkZXZpY2U6ICdjbG9ja2V2
ZW50MCc6IGRldmljZV9hZGQKZGV2aWNlOiAnY2xvY2tldmVudDEnOiBkZXZpY2VfYWRkCmRl
dmljZTogJ2Nsb2NrZXZlbnQyJzogZGV2aWNlX2FkZApkZXZpY2U6ICdjbG9ja2V2ZW50Myc6
IGRldmljZV9hZGQKZGV2aWNlOiAnYnJvYWRjYXN0JzogZGV2aWNlX2FkZApkZXZpY2U6ICdi
cmVha3BvaW50JzogZGV2aWNlX2FkZApkZXZpY2U6ICd1cHJvYmUnOiBkZXZpY2VfYWRkCmRl
dmljZTogJ3RyYWNlcG9pbnQnOiBkZXZpY2VfYWRkCmRldmljZTogJ3NvZnR3YXJlJzogZGV2
aWNlX2FkZApJbml0aWFsaXNlIHN5c3RlbSB0cnVzdGVkIGtleXJpbmdzCndvcmtpbmdzZXQ6
IHRpbWVzdGFtcF9iaXRzPTQyIG1heF9vcmRlcj0xOSBidWNrZXRfb3JkZXI9MApzcXVhc2hm
czogdmVyc2lvbiA0LjAgKDIwMDkvMDEvMzEpIFBoaWxsaXAgTG91Z2hlcgpORlM6IFJlZ2lz
dGVyaW5nIHRoZSBpZF9yZXNvbHZlciBrZXkgdHlwZQpLZXkgdHlwZSBpZF9yZXNvbHZlciBy
ZWdpc3RlcmVkCktleSB0eXBlIGlkX2xlZ2FjeSByZWdpc3RlcmVkCm5mczRmaWxlbGF5b3V0
X2luaXQ6IE5GU3Y0IEZpbGUgTGF5b3V0IERyaXZlciBSZWdpc3RlcmluZy4uLgpuZnM0Zmxl
eGZpbGVsYXlvdXRfaW5pdDogTkZTdjQgRmxleGZpbGUgTGF5b3V0IERyaXZlciBSZWdpc3Rl
cmluZy4uLgpkZXZpY2U6ICdhdXRvZnMnOiBkZXZpY2VfYWRkCktleSB0eXBlIGFzeW1tZXRy
aWMgcmVnaXN0ZXJlZApBc3ltbWV0cmljIGtleSBwYXJzZXIgJ3g1MDknIHJlZ2lzdGVyZWQK
QmxvY2sgbGF5ZXIgU0NTSSBnZW5lcmljIChic2cpIGRyaXZlciB2ZXJzaW9uIDAuNCBsb2Fk
ZWQgKG1ham9yIDI0NSkKaW8gc2NoZWR1bGVyIG1xLWRlYWRsaW5lIHJlZ2lzdGVyZWQKaW8g
c2NoZWR1bGVyIGt5YmVyIHJlZ2lzdGVyZWQKaW8gc2NoZWR1bGVyIGJmcSByZWdpc3RlcmVk
CnRpLXNjaS1pbnRyIGJ1c0BmMDAwMDppbnRlcnJ1cHQtY29udHJvbGxlckBhMDAwMDA6IGVy
cm9yIC1FUFJPQkVfREVGRVI6IHRpLHNjaSByZWFkIGZhaWwKdGktc2NpLWludGEgNDgwMDAw
MDAuaW50ZXJydXB0LWNvbnRyb2xsZXI6IGVycm9yIC1FUFJPQkVfREVGRVI6IHRpLHNjaSBy
ZWFkIGZhaWwKL2J1c0BmMDAwMC9ldGhlcm5ldEA4MDAwMDAwL2NwdHNAM2QwMDAgTGlua2Vk
IGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAKL2J1c0BmMDAwMC9ldGhlcm5l
dEA4MDAwMDAwL2NwdHNAM2QwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNA
ZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMAovYnVzQGYwMDAwL2R3YzMtdXNi
QGY5MTAwMDAvdXNiQDMxMTAwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAv
YnVzQGYwMDAwCi9idXNAZjAwMDAvZHdjMy11c2JAZjkxMDAwMC91c2JAMzExMDAwMDAgRHJv
cHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xs
ZXJAMTgwMDAwMAovYnVzQGYwMDAwL2R3YzMtdXNiQGY5MDAwMDAvdXNiQDMxMDAwMDAwIExp
bmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwCi9idXNAZjAwMDAvZHdj
My11c2JAZjkwMDAwMC91c2JAMzEwMDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRv
IC9idXNAZjAwMDAvaW50ZXJydXB0LWNvbnRyb2xsZXJAMTgwMDAwMAovYnVzQGYwMDAwL2lu
dGVycnVwdC1jb250cm9sbGVyQDE4MDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVy
IHRvIC9idXNAZjAwMDAKL2J1c0BmMDAwMC9pbnRlcnJ1cHQtY29udHJvbGxlckAxODAwMDAw
IERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2ludGVycnVwdC1jb250
cm9sbGVyQDE4MDAwMDAKZGV2aWNlOiAncGxhdGZvcm06YnVzQGYwMDAwLS1wbGF0Zm9ybTpm
OTAwMDAwLmR3YzMtdXNiJzogZGV2aWNlX2FkZApwbGF0Zm9ybSBmOTAwMDAwLmR3YzMtdXNi
OiBMaW5rZWQgYXMgYSBzeW5jIHN0YXRlIG9ubHkgY29uc3VtZXIgdG8gYnVzQGYwMDAwIChm
bGFncyAweDFjMCkKZGV2aWNlOiAncGxhdGZvcm06YnVzQGYwMDAwLS1wbGF0Zm9ybTpmOTEw
MDAwLmR3YzMtdXNiJzogZGV2aWNlX2FkZApwbGF0Zm9ybSBmOTEwMDAwLmR3YzMtdXNiOiBM
aW5rZWQgYXMgYSBzeW5jIHN0YXRlIG9ubHkgY29uc3VtZXIgdG8gYnVzQGYwMDAwIChmbGFn
cyAweDFjMCkKZGV2aWNlOiAncGxhdGZvcm06YnVzQGYwMDAwLS1wbGF0Zm9ybTo4MDAwMDAw
LmV0aGVybmV0JzogZGV2aWNlX2FkZApwbGF0Zm9ybSA4MDAwMDAwLmV0aGVybmV0OiBMaW5r
ZWQgYXMgYSBzeW5jIHN0YXRlIG9ubHkgY29uc3VtZXIgdG8gYnVzQGYwMDAwIChmbGFncyAw
eDFjMCkKcGxhdGZvcm0gMmIzMDAwNTAudGFyZ2V0LW1vZHVsZTogZXJyb3IgLUVQUk9CRV9E
RUZFUjogd2FpdCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0
NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ3BoeS0xMDQwNDQucGh5LjAnOiBk
ZXZpY2VfYWRkCmRldmljZTogJ3BoeS0xMDQwNDQucGh5LjEnOiBkZXZpY2VfYWRkCnBpbmN0
cmwtc2luZ2xlIDQwODQwMDAucGluY3RybDogMzQgcGlucywgc2l6ZSAxMzYKcGluY3RybC1z
aW5nbGUgZjQwMDAucGluY3RybDogMTcxIHBpbnMsIHNpemUgNjg0Ci9idXNAZjAwMDAvc2Vy
aWFsQDI4MDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAv
cGluY3RybEBmNDAwMAovYnVzQGYwMDAwL3NlcmlhbEAyODAwMDAwIERyb3BwaW5nIHRoZSBm
d25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAvbWFpbi11YXJ0MC1kZWZh
dWx0LXBpbnMKL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNv
bnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMAovYnVzQGYwMDAwL2kyY0AyMDAw
MDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0
MDAwL21haW4taTJjMC1kZWZhdWx0LXBpbnMKL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAgTGlu
a2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMAov
YnVzQGYwMDAwL2kyY0AyMDAxMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1
c0BmMDAwMC9waW5jdHJsQGY0MDAwL21haW4taTJjMS1kZWZhdWx0LXBpbnMKL2J1c0BmMDAw
MC9pMmNAMjAwMjAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAw
MDAvcGluY3RybEBmNDAwMAovYnVzQGYwMDAwL2kyY0AyMDAyMDAwMCBEcm9wcGluZyB0aGUg
Zndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwL21haW4taTJjMi1kZWZh
dWx0LXBpbnMKL2J1c0BmMDAwMC9tbWNAZmExMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29u
c3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwCi9idXNAZjAwMDAvbW1jQGZhMTAw
MDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAw
MC9tYWluLW1tYzAtZGVmYXVsdC1waW5zCi9idXNAZjAwMDAvbW1jQGZhMDAwMDAgTGlua2Vk
IGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMAovYnVz
QGYwMDAwL21tY0BmYTAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYw
MDAwL3BpbmN0cmxAZjQwMDAvbWFpbi1tbWMxLWRlZmF1bHQtcGlucwovbGVkcyBMaW5rZWQg
YXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwCi9sZWRz
IERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAv
dXNyLWxlZC1kZWZhdWx0LXBpbnMKL2J1c0BmMDAwMC9ldGhlcm5ldEA4MDAwMDAwL21kaW9A
ZjAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3BpbmN0cmxA
ZjQwMDAKL2J1c0BmMDAwMC9ldGhlcm5ldEA4MDAwMDAwL21kaW9AZjAwIERyb3BwaW5nIHRo
ZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAvbWFpbi1tZGlvMS1k
ZWZhdWx0LXBpbnMKL2J1c0BmMDAwMC9ldGhlcm5ldEA4MDAwMDAwIExpbmtlZCBhcyBhIGZ3
bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAKL2J1c0BmMDAwMC9l
dGhlcm5ldEA4MDAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAw
L3BpbmN0cmxAZjQwMDAvbWFpbi1yZ21paTEtZGVmYXVsdC1waW5zCi9idXNAZjAwMDAvZHdj
My11c2JAZjkxMDAwMC91c2JAMzExMDAwMDAgTGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVy
IHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMAovYnVzQGYwMDAwL2R3YzMtdXNiQGY5MTAw
MDAvdXNiQDMxMTAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAw
L3BpbmN0cmxAZjQwMDAvbWFpbi11c2IxLWRlZmF1bHQtcGlucwovYnVzQGYwMDAwL2F1ZGlv
LWNvbnRyb2xsZXJAMmIxMDAwMCBMaW5rZWQgYXMgYSBmd25vZGUgY29uc3VtZXIgdG8gL2J1
c0BmMDAwMC9waW5jdHJsQGY0MDAwCi9idXNAZjAwMDAvYXVkaW8tY29udHJvbGxlckAyYjEw
MDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQw
MDAvbWFpbi1tY2FzcDEtZGVmYXVsdC1waW5zCi9idXNAZjAwMDAvZHNzQDMwMjAwMDAwIExp
bmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAK
L2J1c0BmMDAwMC9kc3NAMzAyMDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9i
dXNAZjAwMDAvcGluY3RybEBmNDAwMC9tYWluLWRzczAtZGVmYXVsdC1waW5zCi9idXNAZjAw
MDAvZXRoZXJuZXRAODAwMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0Bm
MDAwMC9waW5jdHJsQGY0MDAwL21haW4tcmdtaWkyLWRlZmF1bHQtcGlucwovYnVzQGYwMDAw
L2J1c0BmYzAwMDAwL3NwaUBmYzQwMDAwIExpbmtlZCBhcyBhIGZ3bm9kZSBjb25zdW1lciB0
byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAKL2J1c0BmMDAwMC9idXNAZmMwMDAwMC9zcGlA
ZmM0MDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9waW5jdHJs
QGY0MDAwL29zcGkwLWRlZmF1bHQtcGlucwovcmVndWxhdG9yLTQgTGlua2VkIGFzIGEgZndu
b2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMAovcmVndWxhdG9yLTQg
RHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMC92
ZGQtc2QtZHYtZGVmYXVsdC1waW5zCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2dwaW9AMjIg
TGlua2VkIGFzIGEgZndub2RlIGNvbnN1bWVyIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAw
MAovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyIERyb3BwaW5nIHRoZSBmd25vZGUg
bGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAvbWFpbi1ncGlvMS1pb2V4cC1pbnRy
LWRlZmF1bHQtcGlucwpkZXZpY2U6ICdwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9y
bToyMDAxMDAwMC5pMmMnOiBkZXZpY2VfYWRkCnBsYXRmb3JtIDIwMDEwMDAwLmkyYzogTGlu
a2VkIGFzIGEgc3luYyBzdGF0ZSBvbmx5IGNvbnN1bWVyIHRvIGY0MDAwLnBpbmN0cmwgKGZs
YWdzIDB4MWMwKQpkZXZpY2U6ICdwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTpy
ZWd1bGF0b3ItNCc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9y
LTQgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8g
ZW5kIG9mIGxpc3QKcGxhdGZvcm0gcmVndWxhdG9yLTQ6IExpbmtlZCBhcyBhIGNvbnN1bWVy
IHRvIGY0MDAwLnBpbmN0cmwKL3JlZ3VsYXRvci00IERyb3BwaW5nIHRoZSBmd25vZGUgbGlu
ayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAKZGV2aWNlOiAncGxhdGZvcm06ZjQwMDAu
cGluY3RybC0tcGxhdGZvcm06ZmM0MDAwMC5zcGknOiBkZXZpY2VfYWRkCmRldmljZXNfa3Nl
dDogTW92aW5nIGZjNDAwMDAuc3BpIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGZjNDAwMDAu
c3BpOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byBmNDAwMC5waW5jdHJsCi9idXNAZjAwMDAv
YnVzQGZjMDAwMDAvc3BpQGZjNDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9i
dXNAZjAwMDAvcGluY3RybEBmNDAwMApkZXZpY2U6ICdwbGF0Zm9ybTpmNDAwMC5waW5jdHJs
LS1wbGF0Zm9ybTozMDIwMDAwMC5kc3MnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92
aW5nIDMwMjAwMDAwLmRzcyB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAzMDIwMDAwMC5kc3M6
IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIGY0MDAwLnBpbmN0cmwKL2J1c0BmMDAwMC9kc3NA
MzAyMDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvcGluY3Ry
bEBmNDAwMApkZXZpY2U6ICdwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybToyYjEw
MDAwLmF1ZGlvLWNvbnRyb2xsZXInOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5n
IDJiMTAwMDAuYXVkaW8tY29udHJvbGxlciB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyYjEw
MDAwLmF1ZGlvLWNvbnRyb2xsZXI6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIGY0MDAwLnBp
bmN0cmwKL2J1c0BmMDAwMC9hdWRpby1jb250cm9sbGVyQDJiMTAwMDAgRHJvcHBpbmcgdGhl
IGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMApkZXZpY2U6ICdwbGF0
Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTpmOTEwMDAwLmR3YzMtdXNiJzogZGV2aWNl
X2FkZApwbGF0Zm9ybSBmOTEwMDAwLmR3YzMtdXNiOiBMaW5rZWQgYXMgYSBzeW5jIHN0YXRl
IG9ubHkgY29uc3VtZXIgdG8gZjQwMDAucGluY3RybCAoZmxhZ3MgMHgxYzApCmRldmljZTog
J3BsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3JtOjgwMDAwMDAuZXRoZXJuZXQnOiBk
ZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDgwMDAwMDAuZXRoZXJuZXQgdG8gZW5k
IG9mIGxpc3QKcGxhdGZvcm0gODAwMDAwMC5ldGhlcm5ldDogTGlua2VkIGFzIGEgY29uc3Vt
ZXIgdG8gZjQwMDAucGluY3RybAovYnVzQGYwMDAwL2V0aGVybmV0QDgwMDAwMDAgRHJvcHBp
bmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMApkZXZpY2U6
ICdwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTpsZWRzJzogZGV2aWNlX2FkZApk
ZXZpY2VzX2tzZXQ6IE1vdmluZyBsZWRzIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGxlZHM6
IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIGY0MDAwLnBpbmN0cmwKL2xlZHMgRHJvcHBpbmcg
dGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvcGluY3RybEBmNDAwMApkZXZpY2U6ICdw
bGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTpmYTAwMDAwLm1tYyc6IGRldmljZV9h
ZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKcGxh
dGZvcm0gZmEwMDAwMC5tbWM6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIGY0MDAwLnBpbmN0
cmwKL2J1c0BmMDAwMC9tbWNAZmEwMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8g
L2J1c0BmMDAwMC9waW5jdHJsQGY0MDAwCmRldmljZTogJ3BsYXRmb3JtOmY0MDAwLnBpbmN0
cmwtLXBsYXRmb3JtOmZhMTAwMDAubW1jJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1v
dmluZyBmYTEwMDAwLm1tYyB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSBmYTEwMDAwLm1tYzog
TGlua2VkIGFzIGEgY29uc3VtZXIgdG8gZjQwMDAucGluY3RybAovYnVzQGYwMDAwL21tY0Bm
YTEwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxA
ZjQwMDAKZGV2aWNlOiAncGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxhdGZvcm06MjAwMjAw
MDAuaTJjJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyMDAyMDAwMC5pMmMg
dG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMjAwMjAwMDAuaTJjOiBMaW5rZWQgYXMgYSBjb25z
dW1lciB0byBmNDAwMC5waW5jdHJsCi9idXNAZjAwMDAvaTJjQDIwMDIwMDAwIERyb3BwaW5n
IHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAKZGV2aWNlc19r
c2V0OiBNb3ZpbmcgMjAwMTAwMDAuaTJjIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDIwMDEw
MDAwLmkyYzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gZjQwMDAucGluY3RybAovYnVzQGYw
MDAwL2kyY0AyMDAxMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAw
MC9waW5jdHJsQGY0MDAwCmRldmljZTogJ3BsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRm
b3JtOjIwMDAwMDAwLmkyYyc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjAw
MDAwMDAuaTJjIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDIwMDAwMDAwLmkyYzogTGlua2Vk
IGFzIGEgY29uc3VtZXIgdG8gZjQwMDAucGluY3RybAovYnVzQGYwMDAwL2kyY0AyMDAwMDAw
MCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9waW5jdHJsQGY0MDAw
CmRldmljZTogJ3BsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3JtOjI4MDAwMDAuc2Vy
aWFsJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyODAwMDAwLnNlcmlhbCB0
byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyODAwMDAwLnNlcmlhbDogTGlua2VkIGFzIGEgY29u
c3VtZXIgdG8gZjQwMDAucGluY3RybAovYnVzQGYwMDAwL3NlcmlhbEAyODAwMDAwIERyb3Bw
aW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAKbGVkcy1n
cGlvIGxlZHM6IGVycm9yIC1FUFJPQkVfREVGRVI6IEZhaWxlZCB0byBnZXQgR1BJTyAnL2xl
ZHMvbGVkLTAnCmxlZHRyaWctY3B1OiByZWdpc3RlcmVkIHRvIGluZGljYXRlIGFjdGl2aXR5
IG9uIENQVXMKZGV2aWNlOiAnYWNwaS1laW5qJzogZGV2aWNlX2FkZApwbGF0Zm9ybSAxMDgy
ZTAuY2xvY2stY29udHJvbGxlcjogZXJyb3IgLUVQUk9CRV9ERUZFUjogd2FpdCBmb3Igc3Vw
cGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250
cm9sbGVyCnBsYXRmb3JtIDEwODJlNC5jbG9jay1jb250cm9sbGVyOiBlcnJvciAtRVBST0JF
X0RFRkVSOiB3YWl0IGZvciBzdXBwbGllciAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVy
QDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xsZXIKcGxhdGZvcm0gNDg1YzAxMDAuZG1hLWNvbnRy
b2xsZXI6IGVycm9yIC1FUFJPQkVfREVGRVI6IHN1cHBsaWVyIDQ4MDAwMDAwLmludGVycnVw
dC1jb250cm9sbGVyIG5vdCByZWFkeQpwbGF0Zm9ybSA0ODVjMDAwMC5kbWEtY29udHJvbGxl
cjogZXJyb3IgLUVQUk9CRV9ERUZFUjogc3VwcGxpZXIgNDgwMDAwMDAuaW50ZXJydXB0LWNv
bnRyb2xsZXIgbm90IHJlYWR5CmRldmljZTogJ3B0eXAwJzogZGV2aWNlX2FkZApkZXZpY2U6
ICdwdHlwMSc6IGRldmljZV9hZGQKZGV2aWNlOiAncHR5cDInOiBkZXZpY2VfYWRkCmRldmlj
ZTogJ3B0eXAzJzogZGV2aWNlX2FkZApkZXZpY2U6ICdwdHlwNCc6IGRldmljZV9hZGQKZGV2
aWNlOiAncHR5cDUnOiBkZXZpY2VfYWRkCmRldmljZTogJ3B0eXA2JzogZGV2aWNlX2FkZApk
ZXZpY2U6ICdwdHlwNyc6IGRldmljZV9hZGQKZGV2aWNlOiAncHR5cDgnOiBkZXZpY2VfYWRk
CmRldmljZTogJ3B0eXA5JzogZGV2aWNlX2FkZApkZXZpY2U6ICdwdHlwYSc6IGRldmljZV9h
ZGQKZGV2aWNlOiAncHR5cGInOiBkZXZpY2VfYWRkCmRldmljZTogJ3B0eXBjJzogZGV2aWNl
X2FkZApkZXZpY2U6ICdwdHlwZCc6IGRldmljZV9hZGQKZGV2aWNlOiAncHR5cGUnOiBkZXZp
Y2VfYWRkCmRldmljZTogJ3B0eXBmJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHlwMCc6IGRl
dmljZV9hZGQKZGV2aWNlOiAndHR5cDEnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eXAyJzog
ZGV2aWNlX2FkZApkZXZpY2U6ICd0dHlwMyc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5cDQn
OiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eXA1JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHlw
Nic6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5cDcnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0
eXA4JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHlwOSc6IGRldmljZV9hZGQKZGV2aWNlOiAn
dHR5cGEnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eXBiJzogZGV2aWNlX2FkZApkZXZpY2U6
ICd0dHlwYyc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5cGQnOiBkZXZpY2VfYWRkCmRldmlj
ZTogJ3R0eXBlJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHlwZic6IGRldmljZV9hZGQKZGV2
aWNlOiAncHRteCc6IGRldmljZV9hZGQKU2VyaWFsOiA4MjUwLzE2NTUwIGRyaXZlciwgNCBw
b3J0cywgSVJRIHNoYXJpbmcgZW5hYmxlZApkZXZpY2U6ICdzZXJpYWw4MjUwJzogZGV2aWNl
X2FkZApkZXZpY2U6ICdzZXJpYWw4MjUwOjAnOiBkZXZpY2VfYWRkCmRldmljZTogJ3Nlcmlh
bDgyNTA6MC4wJzogZGV2aWNlX2FkZApkZXZpY2U6ICdzZXJpYWwwJzogZGV2aWNlX2FkZApk
ZXZpY2U6ICd0dHlTMCc6IGRldmljZV9hZGQKZGV2aWNlOiAnc2VyaWFsODI1MDowLjEnOiBk
ZXZpY2VfYWRkCmRldmljZTogJ3NlcmlhbDAnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eVMx
JzogZGV2aWNlX2FkZApkZXZpY2U6ICdzZXJpYWw4MjUwOjAuMic6IGRldmljZV9hZGQKZGV2
aWNlOiAnc2VyaWFsMCc6IGRldmljZV9hZGQKZGV2aWNlOiAndHR5UzInOiBkZXZpY2VfYWRk
CmRldmljZTogJ3NlcmlhbDgyNTA6MC4zJzogZGV2aWNlX2FkZApkZXZpY2U6ICdzZXJpYWww
JzogZGV2aWNlX2FkZApkZXZpY2U6ICd0dHlTMyc6IGRldmljZV9hZGQKU1RNMzIgVVNBUlQg
ZHJpdmVyIGluaXRpYWxpemVkCi9jb25uZWN0b3ItaGRtaSBEcm9wcGluZyB0aGUgZndub2Rl
IGxpbmsgdG8gL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2IKZGV2aWNl
OiAnY2FjaGUnOiBkZXZpY2VfYWRkCmRldmljZTogJ2luZGV4MCc6IGRldmljZV9hZGQKZGV2
aWNlOiAnaW5kZXgxJzogZGV2aWNlX2FkZApkZXZpY2U6ICdpbmRleDInOiBkZXZpY2VfYWRk
CmRldmljZTogJ2NhY2hlJzogZGV2aWNlX2FkZApkZXZpY2U6ICdpbmRleDAnOiBkZXZpY2Vf
YWRkCmRldmljZTogJ2luZGV4MSc6IGRldmljZV9hZGQKZGV2aWNlOiAnaW5kZXgyJzogZGV2
aWNlX2FkZApkZXZpY2U6ICdjYWNoZSc6IGRldmljZV9hZGQKZGV2aWNlOiAnaW5kZXgwJzog
ZGV2aWNlX2FkZApkZXZpY2U6ICdpbmRleDEnOiBkZXZpY2VfYWRkCmRldmljZTogJ2luZGV4
Mic6IGRldmljZV9hZGQKZGV2aWNlOiAnY2FjaGUnOiBkZXZpY2VfYWRkCmRldmljZTogJ2lu
ZGV4MCc6IGRldmljZV9hZGQKZGV2aWNlOiAnaW5kZXgxJzogZGV2aWNlX2FkZApkZXZpY2U6
ICdpbmRleDInOiBkZXZpY2VfYWRkCmRldmljZTogJ2xvb3AtY29udHJvbCc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDAnOiBkZXZpY2VfYWRkCmRldmljZTogJzc6MCc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDEnOiBkZXZpY2VfYWRkCmRldmljZTogJzc6MSc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDInOiBkZXZpY2VfYWRkCmRldmljZTogJzc6Mic6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDMnOiBkZXZpY2VfYWRkCmRldmljZTogJzc6Myc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDQnOiBkZXZpY2VfYWRkCmRldmljZTogJzc6NCc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDUnOiBkZXZpY2VfYWRkCmRldmljZTogJzc6NSc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDYnOiBkZXZpY2VfYWRkCmRldmljZTogJzc6Nic6IGRldmljZV9h
ZGQKZGV2aWNlOiAnbG9vcDcnOiBkZXZpY2VfYWRkCmRldmljZTogJzc6Nyc6IGRldmljZV9h
ZGQKbG9vcDogbW9kdWxlIGxvYWRlZApkZXZpY2U6ICdzeXN0ZW0nOiBkZXZpY2VfYWRkCmRl
dmljZTogJ3Jlc2VydmVkJzogZGV2aWNlX2FkZApkZXZpY2U6ICdtdGQtMCc6IGRldmljZV9h
ZGQKcGxhdGZvcm0gZmM0MDAwMC5zcGk6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9y
IHN1cHBsaWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXIt
Y29udHJvbGxlcgpkZXZpY2U6ICdGaXhlZCBNRElPIGJ1cy4wJzogZGV2aWNlX2FkZApkZXZp
Y2U6ICdmaXhlZC0wJzogZGV2aWNlX2FkZAp0dW46IFVuaXZlcnNhbCBUVU4vVEFQIGRldmlj
ZSBkcml2ZXIsIDEuNgpkZXZpY2U6ICd0dW4nOiBkZXZpY2VfYWRkCnBsYXRmb3JtIDgwMDAw
MDAuZXRoZXJuZXQ6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9i
dXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpk
ZXZpY2U6ICd2ZmlvJzogZGV2aWNlX2FkZApWRklPIC0gVXNlciBMZXZlbCBtZXRhLWRyaXZl
ciB2ZXJzaW9uOiAwLjMKcGxhdGZvcm0gZjkwMDAwMC5kd2MzLXVzYjogZXJyb3IgLUVQUk9C
RV9ERUZFUjogd2FpdCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxl
ckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCnBsYXRmb3JtIGY5MTAwMDAuZHdjMy11c2I6
IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvc3lz
dGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpwbGF0Zm9ybSAyYjFm
MDAwMC5ydGM6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNA
ZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgppMmNf
ZGV2OiBpMmMgL2RldiBlbnRyaWVzIGRyaXZlcgpkZXZpY2U6ICd0aS1jcHVmcmVxJzogZGV2
aWNlX2FkZApkZXZpY2U6ICdjcHVmcmVxLWR0JzogZGV2aWNlX2FkZApjcHUgY3B1MDogZXJy
b3IgLUVQUk9CRV9ERUZFUjogQ291bGRuJ3QgZmluZCBjbG9jawpkZXZpY2U6ICdwc2NpLWNw
dWlkbGUnOiBkZXZpY2VfYWRkCnBsYXRmb3JtIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVy
OiBlcnJvciAtRVBST0JFX0RFRkVSOiBzdXBwbGllciA0ZDAwMDAwMC5tYWlsYm94IG5vdCBy
ZWFkeQpTTUNDQzogU09DX0lEOiBBUkNIX1NPQ19JRCBub3QgaW1wbGVtZW50ZWQsIHNraXBw
aW5nIC4uLi4KcGxhdGZvcm0gMjQwMDAwMC50aW1lcjogZXJyb3IgLUVQUk9CRV9ERUZFUjog
d2FpdCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAw
MC9wb3dlci1jb250cm9sbGVyCnBsYXRmb3JtIDI0MTAwMDAudGltZXI6IGVycm9yIC1FUFJP
QkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xs
ZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpwbGF0Zm9ybSAyNDIwMDAwLnRpbWVyOiBl
cnJvciAtRVBST0JFX0RFRkVSOiB3YWl0IGZvciBzdXBwbGllciAvYnVzQGYwMDAwL3N5c3Rl
bS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKcGxhdGZvcm0gMjQzMDAw
MC50aW1lcjogZXJyb3IgLUVQUk9CRV9ERUZFUjogd2FpdCBmb3Igc3VwcGxpZXIgL2J1c0Bm
MDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCnBsYXRm
b3JtIDI0NDAwMDAudGltZXI6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBs
aWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJv
bGxlcgpwbGF0Zm9ybSAyNDUwMDAwLnRpbWVyOiBlcnJvciAtRVBST0JFX0RFRkVSOiB3YWl0
IGZvciBzdXBwbGllciAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bv
d2VyLWNvbnRyb2xsZXIKcGxhdGZvcm0gMjQ2MDAwMC50aW1lcjogZXJyb3IgLUVQUk9CRV9E
RUZFUjogd2FpdCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0
NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCnBsYXRmb3JtIDI0NzAwMDAudGltZXI6IGVycm9y
IC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvc3lzdGVtLWNv
bnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgp1c2Jjb3JlOiByZWdpc3RlcmVk
IG5ldyBpbnRlcmZhY2UgZHJpdmVyIHVzYmhpZAp1c2JoaWQ6IFVTQiBISUQgY29yZSBkcml2
ZXIKZGV2aWNlOiAnYXJtdjhfY29ydGV4X2E1Myc6IGRldmljZV9hZGQKaHcgcGVyZmV2ZW50
czogZW5hYmxlZCB3aXRoIGFybXY4X2NvcnRleF9hNTMgUE1VIGRyaXZlciwgNyAoMCw4MDAw
MDAzZikgY291bnRlcnMgYXZhaWxhYmxlCndhdGNoZG9nOiBOTUkgbm90IGZ1bGx5IHN1cHBv
cnRlZAp3YXRjaGRvZzogSGFyZCB3YXRjaGRvZyBwZXJtYW5lbnRseSBkaXNhYmxlZApvcHRl
ZTogcHJvYmluZyBmb3IgY29uZHVpdCBtZXRob2QuCm9wdGVlOiByZXZpc2lvbiA0LjAgKDJh
NWIxZDEyKQpkZXZpY2U6ICd0ZWUwJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0ZWVwcml2MCc6
IGRldmljZV9hZGQKb3B0ZWU6IGR5bmFtaWMgc2hhcmVkIG1lbW9yeSBpcyBlbmFibGVkCmRl
dmljZTogJ29wdGVlLXRhLWFiN2E2MTdjLWI4ZTctNGQ4Zi04MzAxLWQwOWI2MTAzNmI2NCc6
IGRldmljZV9hZGQKcmFuZG9tOiBjcm5nIGluaXQgZG9uZQpvcHRlZTogaW5pdGlhbGl6ZWQg
ZHJpdmVyCmRldmljZTogJ3RpbWVyJzogZGV2aWNlX2FkZApkZXZpY2U6ICdzbmQtc29jLWR1
bW15JzogZGV2aWNlX2FkZApORVQ6IFJlZ2lzdGVyZWQgUEZfUEFDS0VUIHByb3RvY29sIGZh
bWlseQpLZXkgdHlwZSBkbnNfcmVzb2x2ZXIgcmVnaXN0ZXJlZApkZXZpY2U6ICdjcHVfZG1h
X2xhdGVuY3knOiBkZXZpY2VfYWRkCnJlZ2lzdGVyZWQgdGFza3N0YXRzIHZlcnNpb24gMQpM
b2FkaW5nIGNvbXBpbGVkLWluIFguNTA5IGNlcnRpZmljYXRlcwpkZXZpY2U6ICdtZW1vcnlf
dGllcjQnOiBkZXZpY2VfYWRkCkRlbW90aW9uIHRhcmdldHMgZm9yIE5vZGUgMDogbnVsbApr
bWVtbGVhazogS2VybmVsIG1lbW9yeSBsZWFrIGRldGVjdG9yIGluaXRpYWxpemVkIChtZW0g
cG9vbCBhdmFpbGFibGU6IDE1NzkxKQprbWVtbGVhazogQXV0b21hdGljIG1lbW9yeSBzY2Fu
bmluZyB0aHJlYWQgc3RhcnRlZApkZXZpY2VzX2tzZXQ6IE1vdmluZyA2MDAwMDAuZ3BpbyB0
byBlbmQgb2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyByZWd1bGF0b3ItNCB0byBlbmQg
b2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1tYyB0byBlbmQgb2YgbGlz
dApwbGF0Zm9ybSA2MDAwMDAuZ3BpbzogZXJyb3IgLUVQUk9CRV9ERUZFUjogd2FpdCBmb3Ig
c3VwcGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1j
b250cm9sbGVyCmRldmljZXNfa3NldDogTW92aW5nIDYwMTAwMC5ncGlvIHRvIGVuZCBvZiBs
aXN0CnBsYXRmb3JtIDYwMTAwMC5ncGlvOiBlcnJvciAtRVBST0JFX0RFRkVSOiB3YWl0IGZv
ciBzdXBwbGllciAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2Nr
LWNvbnRyb2xsZXIKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTEgdG8gZW5kIG9m
IGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTQgdG8gZW5kIG9mIGxpc3QK
ZGV2aWNlc19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKZGV2aWNl
c19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTIgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0
OiBNb3ZpbmcgcmVndWxhdG9yLTMgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVn
dWxhdG9yLTUgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9y
LTMgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8g
ZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTUgdG8gZW5kIG9m
IGxpc3QKZGV2aWNlOiAncmVndWxhdG9yLjInOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDog
TW92aW5nIHJlZ3VsYXRvci00IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5n
IGZhMDAwMDAubW1jIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDIwMDAw
MDAwLmkyYyB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyMDAwMDAwMC5pMmM6IGVycm9yIC1F
UFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRy
b2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2VzX2tzZXQ6IE1vdmluZyAy
MDAxMDAwMC5pMmMgdG8gZW5kIG9mIGxpc3QKZGV2aWNlOiAncmVndWxhdG9yLjMnOiBkZXZp
Y2VfYWRkCnBsYXRmb3JtIDIwMDEwMDAwLmkyYzogZXJyb3IgLUVQUk9CRV9ERUZFUjogd2Fp
dCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9j
bG9jay1jb250cm9sbGVyCmRldmljZXNfa3NldDogTW92aW5nIDIwMDIwMDAwLmkyYyB0byBl
bmQgb2YgbGlzdApwbGF0Zm9ybSAyMDAyMDAwMC5pMmM6IGVycm9yIC1FUFJPQkVfREVGRVI6
IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMw
MDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2VzX2tzZXQ6IE1vdmluZyBidXNAZjAwMDA6aW50
ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDog
TW92aW5nIDYwMDAwMC5ncGlvIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5n
IHJlZ3VsYXRvci00IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGZhMDAw
MDAubW1jIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDYwMTAwMC5ncGlv
IHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIHJlZ3VsYXRvci0zOiBlcnJvciAtRVBST0JFX0RF
RkVSOiB3YWl0IGZvciBzdXBwbGllciAvYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIy
CnBsYXRmb3JtIHJlZ3VsYXRvci01OiBlcnJvciAtRVBST0JFX0RFRkVSOiBzdXBwbGllciBy
ZWd1bGF0b3ItMiBub3QgcmVhZHkKcGxhdGZvcm0gcmVndWxhdG9yLTQ6IGVycm9yIC1FUFJP
QkVfREVGRVI6IHN1cHBsaWVyIDYwMDAwMC5ncGlvIG5vdCByZWFkeQp0aS1zY2ktaW50ciBi
dXNAZjAwMDA6aW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwOiBlcnJvciAtRVBST0JFX0RF
RkVSOiB0aSxzY2kgcmVhZCBmYWlsCmRldmljZXNfa3NldDogTW92aW5nIDQ4MDAwMDAwLmlu
dGVycnVwdC1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5n
IDQ4NWMwMTAwLmRtYS1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDog
TW92aW5nIDQ4NWMwMDAwLmRtYS1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CnRpLXNjaS1p
bnRhIDQ4MDAwMDAwLmludGVycnVwdC1jb250cm9sbGVyOiBlcnJvciAtRVBST0JFX0RFRkVS
OiB0aSxzY2kgcmVhZCBmYWlsCmRldmljZXNfa3NldDogTW92aW5nIDJiMzAwMDUwLnRhcmdl
dC1tb2R1bGUgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMmIzMDAwNTAudGFyZ2V0LW1vZHVs
ZTogZXJyb3IgLUVQUk9CRV9ERUZFUjogd2FpdCBmb3Igc3VwcGxpZXIgL2J1c0BmMDAwMC9z
eXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZXNfa3Nl
dDogTW92aW5nIGxlZHMgdG8gZW5kIG9mIGxpc3QKbGVkcy1ncGlvIGxlZHM6IGVycm9yIC1F
UFJPQkVfREVGRVI6IEZhaWxlZCB0byBnZXQgR1BJTyAnL2xlZHMvbGVkLTAnCmRldmljZXNf
a3NldDogTW92aW5nIDEwODJlMC5jbG9jay1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CnBs
YXRmb3JtIDEwODJlMC5jbG9jay1jb250cm9sbGVyOiBlcnJvciAtRVBST0JFX0RFRkVSOiB3
YWl0IGZvciBzdXBwbGllciAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAw
L2Nsb2NrLWNvbnRyb2xsZXIKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMTA4MmU0LmNsb2NrLWNv
bnRyb2xsZXIgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMTA4MmU0LmNsb2NrLWNvbnRyb2xs
ZXI6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAv
c3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2VzX2tz
ZXQ6IE1vdmluZyA0ODVjMDEwMC5kbWEtY29udHJvbGxlciB0byBlbmQgb2YgbGlzdApwbGF0
Zm9ybSA0ODVjMDEwMC5kbWEtY29udHJvbGxlcjogZXJyb3IgLUVQUk9CRV9ERUZFUjogc3Vw
cGxpZXIgNDgwMDAwMDAuaW50ZXJydXB0LWNvbnRyb2xsZXIgbm90IHJlYWR5CmRldmljZXNf
a3NldDogTW92aW5nIDQ4NWMwMDAwLmRtYS1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CnBs
YXRmb3JtIDQ4NWMwMDAwLmRtYS1jb250cm9sbGVyOiBlcnJvciAtRVBST0JFX0RFRkVSOiBz
dXBwbGllciA0ODAwMDAwMC5pbnRlcnJ1cHQtY29udHJvbGxlciBub3QgcmVhZHkKZGV2aWNl
c19rc2V0OiBNb3ZpbmcgMjgwMDAwMC5zZXJpYWwgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19r
c2V0OiBNb3ZpbmcgZmM0MDAwMC5zcGkgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gZmM0MDAw
MC5zcGk6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAw
MDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpkZXZpY2Vz
X2tzZXQ6IE1vdmluZyA4MDAwMDAwLmV0aGVybmV0IHRvIGVuZCBvZiBsaXN0CnBsYXRmb3Jt
IDgwMDAwMDAuZXRoZXJuZXQ6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdhaXQgZm9yIHN1cHBs
aWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJv
bGxlcgpkZXZpY2VzX2tzZXQ6IE1vdmluZyBmOTAwMDAwLmR3YzMtdXNiIHRvIGVuZCBvZiBs
aXN0CnBsYXRmb3JtIGY5MDAwMDAuZHdjMy11c2I6IGVycm9yIC1FUFJPQkVfREVGRVI6IHdh
aXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAv
cG93ZXItY29udHJvbGxlcgpkZXZpY2VzX2tzZXQ6IE1vdmluZyBmOTEwMDAwLmR3YzMtdXNi
IHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGY5MTAwMDAuZHdjMy11c2I6IGVycm9yIC1FUFJP
QkVfREVGRVI6IHdhaXQgZm9yIHN1cHBsaWVyIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xs
ZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpkZXZpY2VzX2tzZXQ6IE1vdmluZyAyYjFm
MDAwMC5ydGMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMmIxZjAwMDAucnRjOiBlcnJvciAt
RVBST0JFX0RFRkVSOiB3YWl0IGZvciBzdXBwbGllciAvYnVzQGYwMDAwL3N5c3RlbS1jb250
cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlc19rc2V0OiBNb3Zpbmcg
Y3B1ZnJlcS1kdCB0byBlbmQgb2YgbGlzdApjcHUgY3B1MDogZXJyb3IgLUVQUk9CRV9ERUZF
UjogQ291bGRuJ3QgZmluZCBjbG9jawpkZXZpY2VzX2tzZXQ6IE1vdmluZyA0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlciB0byBlbmQgb2YgbGlzdAp0aS1zY2kgNDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6IEFCSTogMy4xIChmaXJtd2FyZSByZXYgMHgwMDA5ICc5LjEuOC0tdjA5
LjAxLjA4IChLb29sIEtvYWxhKScpCmRldmljZTogJzQ0MDQzMDAwLnN5c3RlbS1jb250cm9s
bGVyOnBvd2VyLWNvbnRyb2xsZXInOiBkZXZpY2VfYWRkCmRldmljZTogJ3BsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjJi
MTAwMDAuYXVkaW8tY29udHJvbGxlcic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgMmIxMDAwMC5hdWRpby1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDJi
MTAwMDAuYXVkaW8tY29udHJvbGxlcjogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMw
MDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL2F1ZGlv
LWNvbnRyb2xsZXJAMmIxMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0Bm
MDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCmRldmlj
ZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOmUwZjAwMDAud2F0Y2hkb2cnOiBkZXZpY2VfYWRkCmRldmljZXNfa3Nl
dDogTW92aW5nIGUwZjAwMDAud2F0Y2hkb2cgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gZTBm
MDAwMC53YXRjaGRvZzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwZjAw
MDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRy
b2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0
MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTplMDMw
MDAwLndhdGNoZG9nJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyBlMDMwMDAw
LndhdGNoZG9nIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGUwMzAwMDAud2F0Y2hkb2c6IExp
bmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2Vy
LWNvbnRyb2xsZXIKL2J1c0BmMDAwMC93YXRjaGRvZ0BlMDMwMDAwIERyb3BwaW5nIHRoZSBm
d25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bv
d2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRy
b2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06ZTAyMDAwMC53YXRjaGRvZyc6IGRl
dmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgZTAyMDAwMC53YXRjaGRvZyB0byBlbmQg
b2YgbGlzdApwbGF0Zm9ybSBlMDIwMDAwLndhdGNoZG9nOiBMaW5rZWQgYXMgYSBjb25zdW1l
ciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyCi9idXNA
ZjAwMDAvd2F0Y2hkb2dAZTAyMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1
c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCmRl
dmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRy
b2xsZXItLXBsYXRmb3JtOmUwMTAwMDAud2F0Y2hkb2cnOiBkZXZpY2VfYWRkCmRldmljZXNf
a3NldDogTW92aW5nIGUwMTAwMDAud2F0Y2hkb2cgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0g
ZTAxMDAwMC53YXRjaGRvZzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lz
dGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUw
MTAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNv
bnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0
NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTpl
MDAwMDAwLndhdGNoZG9nJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyBlMDAw
MDAwLndhdGNoZG9nIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGUwMDAwMDAud2F0Y2hkb2c6
IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBv
d2VyLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC93YXRjaGRvZ0BlMDAwMDAwIERyb3BwaW5nIHRo
ZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAw
L3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNv
bnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MzAyMDAwMDAuZHNzJzogZGV2
aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAzMDIwMDAwMC5kc3MgdG8gZW5kIG9mIGxp
c3QKcGxhdGZvcm0gMzAyMDAwMDAuZHNzOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0
MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvZHNz
QDMwMjAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3Rl
bS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZv
cm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZv
cm06ODAwMDAwMC5ldGhlcm5ldCc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zpbmcg
ODAwMDAwMC5ldGhlcm5ldCB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSA4MDAwMDAwLmV0aGVy
bmV0OiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpwb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvZXRoZXJuZXRAODAwMDAwMCBEcm9wcGlu
ZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0
MzAwMC9wb3dlci1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZkMDAwMDAuZ3B1Jzog
ZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmZDAwMDAwLmdwdSB0byBlbmQgb2Yg
bGlzdApwbGF0Zm9ybSBmZDAwMDAwLmdwdTogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL2dw
dUBmZDAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3Rl
bS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZv
cm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZv
cm06ZmM0MDAwMC5zcGknOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIGZjNDAw
MDAuc3BpIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGZjNDAwMDAuc3BpOiBMaW5rZWQgYXMg
YSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9s
bGVyCi9idXNAZjAwMDAvYnVzQGZjMDAwMDAvc3BpQGZjNDAwMDAgRHJvcHBpbmcgdGhlIGZ3
bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93
ZXItY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJv
bGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTpmOTEwMDAwLmR3YzMtdXNiJzogZGV2
aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmOTEwMDAwLmR3YzMtdXNiIHRvIGVuZCBv
ZiBsaXN0CnBsYXRmb3JtIGY5MTAwMDAuZHdjMy11c2I6IExpbmtlZCBhcyBhIGNvbnN1bWVy
IHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXIKL2J1c0Bm
MDAwMC9kd2MzLXVzYkBmOTEwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVz
QGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2
aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJv
bGxlci0tcGxhdGZvcm06ZjkwMDAwMC5kd2MzLXVzYic6IGRldmljZV9hZGQKZGV2aWNlc19r
c2V0OiBNb3ZpbmcgZjkwMDAwMC5kd2MzLXVzYiB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSBm
OTAwMDAwLmR3YzMtdXNiOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0
ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvZHdjMy11c2JAZjkw
MDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29u
dHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZh
MDAwMDAubW1jJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1t
YyB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSBmYTAwMDAwLm1tYzogTGlua2VkIGFzIGEgY29u
c3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlcgov
YnVzQGYwMDAwL21tY0BmYTAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVz
QGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2
aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJv
bGxlci0tcGxhdGZvcm06ZmExMDAwMC5tbWMnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDog
TW92aW5nIGZhMTAwMDAubW1jIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGZhMTAwMDAubW1j
OiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpw
b3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvbW1jQGZhMTAwMDAgRHJvcHBpbmcgdGhlIGZ3
bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93
ZXItY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJv
bGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTo2MDEwMDAuZ3Bpbyc6IGRldmljZV9h
ZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgNjAxMDAwLmdwaW8gdG8gZW5kIG9mIGxpc3QKcGxh
dGZvcm0gNjAxMDAwLmdwaW86IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5
c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9ncGlvQDYwMTAw
MCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJv
bGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQz
MDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjYwMDAw
MC5ncGlvJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyA2MDAwMDAuZ3BpbyB0
byBlbmQgb2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyByZWd1bGF0b3ItNCB0byBlbmQg
b2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1tYyB0byBlbmQgb2YgbGlz
dApwbGF0Zm9ybSA2MDAwMDAuZ3BpbzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMw
MDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL2dwaW9A
NjAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1j
b250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06
NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06
MjAwMjAwMDAuaTJjJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyMDAyMDAw
MC5pMmMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMjAwMjAwMDAuaTJjOiBMaW5rZWQgYXMg
YSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9s
bGVyCi9idXNAZjAwMDAvaTJjQDIwMDIwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0
byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xs
ZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXIt
Y29udHJvbGxlci0tcGxhdGZvcm06MjAwMTAwMDAuaTJjJzogZGV2aWNlX2FkZApkZXZpY2Vz
X2tzZXQ6IE1vdmluZyAyMDAxMDAwMC5pMmMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMjAw
MTAwMDAuaTJjOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29u
dHJvbGxlcjpwb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAwIERyb3Bw
aW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0
MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lz
dGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjAwMDAwMDAuaTJj
JzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyMDAwMDAwMC5pMmMgdG8gZW5k
IG9mIGxpc3QKcGxhdGZvcm0gMjAwMDAwMDAuaTJjOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0
byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyCi9idXNAZjAw
MDAvaTJjQDIwMDAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAw
L3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAn
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0t
cGxhdGZvcm06MjgwMDAwMC5zZXJpYWwnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92
aW5nIDI4MDAwMDAuc2VyaWFsIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDI4MDAwMDAuc2Vy
aWFsOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpwb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvc2VyaWFsQDI4MDAwMDAgRHJvcHBpbmcg
dGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMw
MDAvcG93ZXItY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0t
Y29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDcwMDAwLnRpbWVyJzog
ZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyNDcwMDAwLnRpbWVyIHRvIGVuZCBv
ZiBsaXN0CnBsYXRmb3JtIDI0NzAwMDAudGltZXI6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRv
IDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXIKL2J1c0BmMDAw
MC90aW1lckAyNDcwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAw
L3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAn
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0t
cGxhdGZvcm06MjQ2MDAwMC50aW1lcic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgMjQ2MDAwMC50aW1lciB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyNDYwMDAwLnRpbWVy
OiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpw
b3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQ2MDAwMCBEcm9wcGluZyB0aGUg
Zndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9w
b3dlci1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250
cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0NTAwMDAudGltZXInOiBkZXZp
Y2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDI0NTAwMDAudGltZXIgdG8gZW5kIG9mIGxp
c3QKcGxhdGZvcm0gMjQ1MDAwMC50aW1lcjogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlcgovYnVzQGYwMDAwL3Rp
bWVyQDI0NTAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lz
dGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0
Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0
Zm9ybToyNDQwMDAwLnRpbWVyJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAy
NDQwMDAwLnRpbWVyIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDI0NDAwMDAudGltZXI6IExp
bmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2Vy
LWNvbnRyb2xsZXIKL2J1c0BmMDAwMC90aW1lckAyNDQwMDAwIERyb3BwaW5nIHRoZSBmd25v
ZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2Vy
LWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xs
ZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjQzMDAwMC50aW1lcic6IGRldmljZV9h
ZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjQzMDAwMC50aW1lciB0byBlbmQgb2YgbGlzdApw
bGF0Zm9ybSAyNDMwMDAwLnRpbWVyOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJA
MjQzMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0t
Y29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3Jt
OjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3Jt
OjI0MjAwMDAudGltZXInOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDI0MjAw
MDAudGltZXIgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMjQyMDAwMC50aW1lcjogTGlua2Vk
IGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29u
dHJvbGxlcgovYnVzQGYwMDAwL3RpbWVyQDI0MjAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBs
aW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvcG93ZXItY29u
dHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpw
b3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDEwMDAwLnRpbWVyJzogZGV2aWNlX2FkZApk
ZXZpY2VzX2tzZXQ6IE1vdmluZyAyNDEwMDAwLnRpbWVyIHRvIGVuZCBvZiBsaXN0CnBsYXRm
b3JtIDI0MTAwMDAudGltZXI6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5
c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC90aW1lckAyNDEw
MDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250
cm9sbGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjQw
MDAwMC50aW1lcic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjQwMDAwMC50
aW1lciB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyNDAwMDAwLnRpbWVyOiBMaW5rZWQgYXMg
YSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9s
bGVyCi9idXNAZjAwMDAvdGltZXJAMjQwMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsg
dG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9s
bGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2Vy
LWNvbnRyb2xsZXItLXBsYXRmb3JtOmIwMDAwMC50ZW1wZXJhdHVyZS1zZW5zb3InOiBkZXZp
Y2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIGIwMDAwMC50ZW1wZXJhdHVyZS1zZW5zb3Ig
dG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gYjAwMDAwLnRlbXBlcmF0dXJlLXNlbnNvcjogTGlu
a2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXIt
Y29udHJvbGxlcgovYnVzQGYwMDAwL2J1c0BiMDAwMDAvdGVtcGVyYXR1cmUtc2Vuc29yQGIw
MDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29u
dHJvbGxlckA0NDA0MzAwMC9wb3dlci1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjJi
MWYwMDAwLnJ0Yyc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMmIxZjAwMDAu
cnRjIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDJiMWYwMDAwLnJ0YzogTGlua2VkIGFzIGEg
Y29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxl
cgovYnVzQGYwMDAwL2J1c0BiMDAwMDAvcnRjQDJiMWYwMDAwIERyb3BwaW5nIHRoZSBmd25v
ZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL3Bvd2Vy
LWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xs
ZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MmIzMDAwNTAudGFyZ2V0LW1vZHVsZSc6
IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMmIzMDAwNTAudGFyZ2V0LW1vZHVs
ZSB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyYjMwMDA1MC50YXJnZXQtbW9kdWxlOiBMaW5r
ZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1j
b250cm9sbGVyCi9idXNAZjAwMDAvYnVzQGIwMDAwMC90YXJnZXQtbW9kdWxlQDJiMzAwMDUw
IERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9s
bGVyQDQ0MDQzMDAwL3Bvd2VyLWNvbnRyb2xsZXIKZGV2aWNlOiAnNDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcic6IGRldmljZV9hZGQKZGV2aWNlOiAncGxh
dGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxh
dGZvcm06MmIxMDAwMC5hdWRpby1jb250cm9sbGVyJzogZGV2aWNlX2FkZApkZXZpY2VzX2tz
ZXQ6IE1vdmluZyAyYjEwMDAwLmF1ZGlvLWNvbnRyb2xsZXIgdG8gZW5kIG9mIGxpc3QKcGxh
dGZvcm0gMmIxMDAwMC5hdWRpby1jb250cm9sbGVyOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0
byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyCi9idXNAZjAw
MDAvYXVkaW8tY29udHJvbGxlckAyYjEwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0
byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xs
ZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2st
Y29udHJvbGxlci0tcGxhdGZvcm06ZTBmMDAwMC53YXRjaGRvZyc6IGRldmljZV9hZGQKZGV2
aWNlc19rc2V0OiBNb3ZpbmcgZTBmMDAwMC53YXRjaGRvZyB0byBlbmQgb2YgbGlzdApwbGF0
Zm9ybSBlMGYwMDAwLndhdGNoZG9nOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvd2F0Y2hk
b2dAZTBmMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0
ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ3BsYXRm
b3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRm
b3JtOmUwMzAwMDAud2F0Y2hkb2cnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5n
IGUwMzAwMDAud2F0Y2hkb2cgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gZTAzMDAwMC53YXRj
aGRvZzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xs
ZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwMzAwMDAgRHJvcHBp
bmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQw
NDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0
ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybTplMDIwMDAwLndhdGNo
ZG9nJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyBlMDIwMDAwLndhdGNoZG9n
IHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIGUwMjAwMDAud2F0Y2hkb2c6IExpbmtlZCBhcyBh
IGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xs
ZXIKL2J1c0BmMDAwMC93YXRjaGRvZ0BlMDIwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGlu
ayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRy
b2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xv
Y2stY29udHJvbGxlci0tcGxhdGZvcm06ZTAxMDAwMC53YXRjaGRvZyc6IGRldmljZV9hZGQK
ZGV2aWNlc19rc2V0OiBNb3ZpbmcgZTAxMDAwMC53YXRjaGRvZyB0byBlbmQgb2YgbGlzdApw
bGF0Zm9ybSBlMDEwMDAwLndhdGNoZG9nOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0
MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvd2F0
Y2hkb2dAZTAxMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9z
eXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ3Bs
YXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBs
YXRmb3JtOmUwMDAwMDAud2F0Y2hkb2cnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92
aW5nIGUwMDAwMDAud2F0Y2hkb2cgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gZTAwMDAwMC53
YXRjaGRvZzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRy
b2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL3dhdGNoZG9nQGUwMDAwMDAgRHJv
cHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJA
NDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybTozMDIwMDAwMC5k
c3MnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDMwMjAwMDAwLmRzcyB0byBl
bmQgb2YgbGlzdApwbGF0Zm9ybSAzMDIwMDAwMC5kc3M6IExpbmtlZCBhcyBhIGNvbnN1bWVy
IHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXIKL2J1c0Bm
MDAwMC9kc3NAMzAyMDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAw
MDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2U6
ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVy
LS1wbGF0Zm9ybTo4MDAwMDAwLmV0aGVybmV0JzogZGV2aWNlX2FkZApwbGF0Zm9ybSA4MDAw
MDAwLmV0aGVybmV0OiBMaW5rZWQgYXMgYSBzeW5jIHN0YXRlIG9ubHkgY29uc3VtZXIgdG8g
NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlciAoZmxhZ3MgMHgx
YzApCmRldmljZXNfa3NldDogTW92aW5nIDgwMDAwMDAuZXRoZXJuZXQgdG8gZW5kIG9mIGxp
c3QKcGxhdGZvcm0gODAwMDAwMC5ldGhlcm5ldDogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8g
NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAw
L2V0aGVybmV0QDgwMDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAw
MDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2U6
ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVy
LS1wbGF0Zm9ybTpmZDAwMDAwLmdwdSc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgZmQwMDAwMC5ncHUgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gZmQwMDAwMC5ncHU6IExp
bmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2Nr
LWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9ncHVAZmQwMDAwMCBEcm9wcGluZyB0aGUgZndub2Rl
IGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1j
b250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVy
OmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZjNDAwMDAuc3BpJzogZGV2aWNlX2FkZApk
ZXZpY2VzX2tzZXQ6IE1vdmluZyBmYzQwMDAwLnNwaSB0byBlbmQgb2YgbGlzdApwbGF0Zm9y
bSBmYzQwMDAwLnNwaTogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2J1c0BmYzAwMDAwL3Nw
aUBmYzQwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3Rl
bS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZv
cm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZv
cm06ZjkxMDAwMC5kd2MzLXVzYic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zpbmcg
ZjkxMDAwMC5kd2MzLXVzYiB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSBmOTEwMDAwLmR3YzMt
dXNiOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpjbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvZHdjMy11c2JAZjkxMDAwMCBEcm9wcGlu
ZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0
MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOmY5MDAwMDAuZHdjMy11
c2InOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIGY5MDAwMDAuZHdjMy11c2Ig
dG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gZjkwMDAwMC5kd2MzLXVzYjogTGlua2VkIGFzIGEg
Y29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxl
cgovYnVzQGYwMDAwL2R3YzMtdXNiQGY5MDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5r
IHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJv
bGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9j
ay1jb250cm9sbGVyLS1wbGF0Zm9ybTpmYTAwMDAwLm1tYyc6IGRldmljZV9hZGQKZGV2aWNl
c19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gZmEw
MDAwMC5tbWM6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250
cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9tbWNAZmEwMDAwMCBEcm9wcGlu
ZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0
MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZhMTAwMDAubW1jJzog
ZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTEwMDAwLm1tYyB0byBlbmQgb2Yg
bGlzdApwbGF0Zm9ybSBmYTEwMDAwLm1tYzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL21t
Y0BmYTEwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3Rl
bS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZv
cm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZv
cm06NjAxMDAwLmdwaW8nOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDYwMTAw
MC5ncGlvIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDYwMTAwMC5ncGlvOiBMaW5rZWQgYXMg
YSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9s
bGVyCi9idXNAZjAwMDAvZ3Bpb0A2MDEwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRv
IC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxl
cgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1j
b250cm9sbGVyLS1wbGF0Zm9ybTo2MDAwMDAuZ3Bpbyc6IGRldmljZV9hZGQKZGV2aWNlc19r
c2V0OiBNb3ZpbmcgNjAwMDAwLmdwaW8gdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBN
b3ZpbmcgcmVndWxhdG9yLTQgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3Zpbmcg
ZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gNjAwMDAwLmdwaW86IExpbmtl
ZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNv
bnRyb2xsZXIKL2J1c0BmMDAwMC9ncGlvQDYwMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxp
bmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250
cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNs
b2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjIwMDIwMDAwLmkyYyc6IGRldmljZV9hZGQKZGV2
aWNlc19rc2V0OiBNb3ZpbmcgMjAwMjAwMDAuaTJjIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3Jt
IDIwMDIwMDAwLmkyYzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2kyY0AyMDAyMDAwMCBE
cm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxl
ckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAw
LnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjIwMDEwMDAw
LmkyYyc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjAwMTAwMDAuaTJjIHRv
IGVuZCBvZiBsaXN0CnBsYXRmb3JtIDIwMDEwMDAwLmkyYzogTGlua2VkIGFzIGEgY29uc3Vt
ZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVz
QGYwMDAwL2kyY0AyMDAxMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0Bm
MDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmlj
ZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjIwMDAwMDAwLmkyYyc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBN
b3ZpbmcgMjAwMDAwMDAuaTJjIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDIwMDAwMDAwLmky
YzogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6
Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL2kyY0AyMDAwMDAwMCBEcm9wcGluZyB0aGUg
Zndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9j
bG9jay1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250
cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI4MDAwMDAuc2VyaWFsJzogZGV2
aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyODAwMDAwLnNlcmlhbCB0byBlbmQgb2Yg
bGlzdApwbGF0Zm9ybSAyODAwMDAwLnNlcmlhbDogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8g
NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAw
L3NlcmlhbEAyODAwMDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAw
L3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xsZXIKZGV2aWNlOiAn
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0t
cGxhdGZvcm06MjQ3MDAwMC50aW1lcic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgMjQ3MDAwMC50aW1lciB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyNDcwMDAwLnRpbWVy
OiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpj
bG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJAMjQ3MDAwMCBEcm9wcGluZyB0aGUg
Zndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9j
bG9jay1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250
cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0NjAwMDAudGltZXInOiBkZXZp
Y2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDI0NjAwMDAudGltZXIgdG8gZW5kIG9mIGxp
c3QKcGxhdGZvcm0gMjQ2MDAwMC50aW1lcjogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL3Rp
bWVyQDI0NjAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lz
dGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0
Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0
Zm9ybToyNDUwMDAwLnRpbWVyJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAy
NDUwMDAwLnRpbWVyIHRvIGVuZCBvZiBsaXN0CnBsYXRmb3JtIDI0NTAwMDAudGltZXI6IExp
bmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2Nr
LWNvbnRyb2xsZXIKL2J1c0BmMDAwMC90aW1lckAyNDUwMDAwIERyb3BwaW5nIHRoZSBmd25v
ZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Nsb2Nr
LWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xs
ZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06MjQ0MDAwMC50aW1lcic6IGRldmljZV9h
ZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjQ0MDAwMC50aW1lciB0byBlbmQgb2YgbGlzdApw
bGF0Zm9ybSAyNDQwMDAwLnRpbWVyOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvdGltZXJA
MjQ0MDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0t
Y29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmljZTogJ3BsYXRmb3Jt
OjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3Jt
OjI0MzAwMDAudGltZXInOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDI0MzAw
MDAudGltZXIgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMjQzMDAwMC50aW1lcjogTGlua2Vk
IGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29u
dHJvbGxlcgovYnVzQGYwMDAwL3RpbWVyQDI0MzAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBs
aW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29u
dHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpj
bG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDIwMDAwLnRpbWVyJzogZGV2aWNlX2FkZApk
ZXZpY2VzX2tzZXQ6IE1vdmluZyAyNDIwMDAwLnRpbWVyIHRvIGVuZCBvZiBsaXN0CnBsYXRm
b3JtIDI0MjAwMDAudGltZXI6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5
c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC90aW1lckAyNDIw
MDAwIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250
cm9sbGVyQDQ0MDQzMDAwL2Nsb2NrLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06MjQx
MDAwMC50aW1lcic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjQxMDAwMC50
aW1lciB0byBlbmQgb2YgbGlzdApwbGF0Zm9ybSAyNDEwMDAwLnRpbWVyOiBMaW5rZWQgYXMg
YSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9s
bGVyCi9idXNAZjAwMDAvdGltZXJAMjQxMDAwMCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsg
dG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9s
bGVyCmRldmljZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2Nr
LWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0MDAwMDAudGltZXInOiBkZXZpY2VfYWRkCmRldmlj
ZXNfa3NldDogTW92aW5nIDI0MDAwMDAudGltZXIgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0g
MjQwMDAwMC50aW1lcjogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gNDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVzQGYwMDAwL3RpbWVyQDI0MDAwMDAg
RHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xs
ZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2U6ICdwbGF0Zm9ybTo0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToxMDgyZTQu
Y2xvY2stY29udHJvbGxlcic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMTA4
MmU0LmNsb2NrLWNvbnRyb2xsZXIgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gMTA4MmU0LmNs
b2NrLWNvbnRyb2xsZXI6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIDQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXIKL2J1c0BmMDAwMC9idXNAMTAwMDAwL2Ns
b2NrLWNvbnRyb2xsZXJAODJlNCBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0Bm
MDAwMC9zeXN0ZW0tY29udHJvbGxlckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRldmlj
ZTogJ3BsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjEwODJlMC5jbG9jay1jb250cm9sbGVyJzogZGV2aWNlX2FkZApkZXZp
Y2VzX2tzZXQ6IE1vdmluZyAxMDgyZTAuY2xvY2stY29udHJvbGxlciB0byBlbmQgb2YgbGlz
dApwbGF0Zm9ybSAxMDgyZTAuY2xvY2stY29udHJvbGxlcjogTGlua2VkIGFzIGEgY29uc3Vt
ZXIgdG8gNDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlcgovYnVz
QGYwMDAwL2J1c0AxMDAwMDAvY2xvY2stY29udHJvbGxlckA4MmUwIERyb3BwaW5nIHRoZSBm
d25vZGUgbGluayB0byAvYnVzQGYwMDAwL3N5c3RlbS1jb250cm9sbGVyQDQ0MDQzMDAwL2Ns
b2NrLWNvbnRyb2xsZXIKZGV2aWNlOiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRy
b2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06MmIxZjAwMDAucnRjJzogZGV2aWNl
X2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyYjFmMDAwMC5ydGMgdG8gZW5kIG9mIGxpc3QK
cGxhdGZvcm0gMmIxZjAwMDAucnRjOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvYnVzQGIw
MDAwMC9ydGNAMmIxZjAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAw
MDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2stY29udHJvbGxlcgpkZXZpY2U6
ICdwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVy
LS1wbGF0Zm9ybToyYjMwMDA1MC50YXJnZXQtbW9kdWxlJzogZGV2aWNlX2FkZApkZXZpY2Vz
X2tzZXQ6IE1vdmluZyAyYjMwMDA1MC50YXJnZXQtbW9kdWxlIHRvIGVuZCBvZiBsaXN0CnBs
YXRmb3JtIDJiMzAwMDUwLnRhcmdldC1tb2R1bGU6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRv
IDQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXIKL2J1c0BmMDAw
MC9idXNAYjAwMDAwL3RhcmdldC1tb2R1bGVAMmIzMDAwNTAgRHJvcHBpbmcgdGhlIGZ3bm9k
ZSBsaW5rIHRvIC9idXNAZjAwMDAvc3lzdGVtLWNvbnRyb2xsZXJANDQwNDMwMDAvY2xvY2st
Y29udHJvbGxlcgpkZXZpY2U6ICc0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpyZXNldC1j
b250cm9sbGVyJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyNDAwMDAwLnRp
bWVyIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDI0MTAwMDAudGltZXIg
dG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjQyMDAwMC50aW1lciB0byBl
bmQgb2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyNDMwMDAwLnRpbWVyIHRvIGVuZCBv
ZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDI0NDAwMDAudGltZXIgdG8gZW5kIG9mIGxp
c3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjQ1MDAwMC50aW1lciB0byBlbmQgb2YgbGlzdApk
ZXZpY2VzX2tzZXQ6IE1vdmluZyAyNDYwMDAwLnRpbWVyIHRvIGVuZCBvZiBsaXN0CmRldmlj
ZXNfa3NldDogTW92aW5nIDI0NzAwMDAudGltZXIgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19r
c2V0OiBNb3ZpbmcgNjAwMDAwLmdwaW8gdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBN
b3ZpbmcgcmVndWxhdG9yLTQgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3Zpbmcg
ZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gNjAwMDAwLmdwaW86IGVycm9y
IC1FUFJPQkVfREVGRVI6IHN1cHBsaWVyIGJ1c0BmMDAwMDppbnRlcnJ1cHQtY29udHJvbGxl
ckBhMDAwMDAgbm90IHJlYWR5CmRldmljZXNfa3NldDogTW92aW5nIDYwMTAwMC5ncGlvIHRv
IGVuZCBvZiBsaXN0CnBsYXRmb3JtIDYwMTAwMC5ncGlvOiBlcnJvciAtRVBST0JFX0RFRkVS
OiBzdXBwbGllciBidXNAZjAwMDA6aW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwIG5vdCBy
ZWFkeQpkZXZpY2VzX2tzZXQ6IE1vdmluZyByZWd1bGF0b3ItNCB0byBlbmQgb2YgbGlzdApk
ZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1tYyB0byBlbmQgb2YgbGlzdApkZXZpY2Vz
X2tzZXQ6IE1vdmluZyAyMDAwMDAwMC5pMmMgdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gcmVn
dWxhdG9yLTQ6IGVycm9yIC1FUFJPQkVfREVGRVI6IHN1cHBsaWVyIDYwMDAwMC5ncGlvIG5v
dCByZWFkeQpkZXZpY2U6ICdpMmMtMCc6IGRldmljZV9hZGQKZGV2aWNlOiAnaTJjLTAnOiBk
ZXZpY2VfYWRkCmRldmljZTogJzAtMDA1MSc6IGRldmljZV9hZGQKZGV2aWNlOiAnMC0wMDNm
JzogZGV2aWNlX2FkZAotLS0tLSBjeWNsZTogc3RhcnQgLS0tLS0KL2J1c0BmMDAwMC9kd2Mz
LXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAw
MC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhAM2YvY29ubmVjdG9yCi9idXNAZjAwMDAvaTJjQDIw
MDAwMDAwL3RwczY1OTh4QDNmL2Nvbm5lY3RvcjogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0Bm
MDAwMC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMAotLS0tLSBjeWNsZTogZW5kIC0t
LS0tCi9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nvbm5lY3RvcjogRml4
ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRoIC9idXNAZjAwMDAvZHdjMy11c2JAZjkwMDAw
MC91c2JAMzEwMDAwMDAKb21hcF9pMmMgMjAwMDAwMDAuaTJjOiBidXMgMCByZXYwLjEyIGF0
IDQwMCBrSHoKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMjAwMTAwMDAuaTJjIHRvIGVuZCBvZiBs
aXN0CmRldmljZTogJ2kyYy0xJzogZGV2aWNlX2FkZApkZXZpY2U6ICdpMmMtMSc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAnMS0wMDFiJzogZGV2aWNlX2FkZApkZXZpY2U6ICdwbGF0Zm9ybTpy
ZWd1bGF0b3ItNS0taTJjOjEtMDAxYic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgMS0wMDFiIHRvIGVuZCBvZiBsaXN0CmkyYyAxLTAwMWI6IExpbmtlZCBhcyBhIGNvbnN1
bWVyIHRvIHJlZ3VsYXRvci01Ci9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2F1ZGlvLWNvZGVj
QDFiIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvcmVndWxhdG9yLTUKZGV2aWNlOiAn
cGxhdGZvcm06cmVndWxhdG9yLTItLWkyYzoxLTAwMWInOiBkZXZpY2VfYWRkCmRldmljZXNf
a3NldDogTW92aW5nIDEtMDAxYiB0byBlbmQgb2YgbGlzdAppMmMgMS0wMDFiOiBMaW5rZWQg
YXMgYSBjb25zdW1lciB0byByZWd1bGF0b3ItMgovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9h
dWRpby1jb2RlY0AxYiBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL3JlZ3VsYXRvci0y
CmRldmljZTogJzEtMDAzYic6IGRldmljZV9hZGQKLS0tLS0gY3ljbGU6IHN0YXJ0IC0tLS0t
Ci9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiOiBjeWNsZTogZGVwZW5k
cyBvbiAvYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMAotLS0tLSBjeWNsZTogc3RhcnQgLS0tLS0K
L2J1c0BmMDAwMC9pMmNAMjAwMTAwMDA6IGN5Y2xlOiBkZXBlbmRzIG9uIC9idXNAZjAwMDAv
ZHNzQDMwMjAwMDAwCi9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2dwaW9AMjI6IGN5Y2xlOiBj
aGlsZCBvZiAvYnVzQGYwMDAwL2kyY0AyMDAxMDAwMAovYnVzQGYwMDAwL2kyY0AyMDAxMDAw
MC9icmlkZ2UtaGRtaUAzYjogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAwMC9pMmNAMjAw
MTAwMDAvZ3Bpb0AyMgovYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMDogY3ljbGU6IGRlcGVuZHMg
b24gL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2IKLS0tLS0gY3ljbGU6
IGVuZCAtLS0tLQovYnVzQGYwMDAwL2Rzc0AzMDIwMDAwMDogRml4ZWQgZGVwZW5kZW5jeSBj
eWNsZShzKSB3aXRoIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiCmRl
dmljZTogJ2kyYzoxLTAwM2ItLXBsYXRmb3JtOjMwMjAwMDAwLmRzcyc6IGRldmljZV9hZGQK
cGxhdGZvcm0gMzAyMDAwMDAuZHNzOiBMaW5rZWQgYXMgYSBzeW5jIHN0YXRlIG9ubHkgY29u
c3VtZXIgdG8gMS0wMDNiIChmbGFncyAweDNjMCkKL2J1c0BmMDAwMC9kc3NAMzAyMDAwMDAg
RHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwL2Jy
aWRnZS1oZG1pQDNiCmRldmljZTogJ3BsYXRmb3JtOmNvbm5lY3Rvci1oZG1pLS1pMmM6MS0w
MDNiJzogZGV2aWNlX2FkZAppMmMgMS0wMDNiOiBMaW5rZWQgYXMgYSBzeW5jIHN0YXRlIG9u
bHkgY29uc3VtZXIgdG8gY29ubmVjdG9yLWhkbWkgKGZsYWdzIDB4M2MwKQovYnVzQGYwMDAw
L2kyY0AyMDAxMDAwMC9icmlkZ2UtaGRtaUAzYiBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsg
dG8gL2Nvbm5lY3Rvci1oZG1pCi0tLS0tIGN5Y2xlOiBzdGFydCAtLS0tLQovYnVzQGYwMDAw
L2Rzc0AzMDIwMDAwMDogY3ljbGU6IGRlcGVuZHMgb24gL2J1c0BmMDAwMC9pMmNAMjAwMTAw
MDAvYnJpZGdlLWhkbWlAM2IKL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlA
M2I6IGN5Y2xlOiBkZXBlbmRzIG9uIC9idXNAZjAwMDAvZHNzQDMwMjAwMDAwCi0tLS0tIGN5
Y2xlOiBlbmQgLS0tLS0KL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2I6
IEZpeGVkIGRlcGVuZGVuY3kgY3ljbGUocykgd2l0aCAvYnVzQGYwMDAwL2Rzc0AzMDIwMDAw
MApkZXZpY2U6ICdwbGF0Zm9ybTozMDIwMDAwMC5kc3MtLWkyYzoxLTAwM2InOiBkZXZpY2Vf
YWRkCmkyYyAxLTAwM2I6IExpbmtlZCBhcyBhIHN5bmMgc3RhdGUgb25seSBjb25zdW1lciB0
byAzMDIwMDAwMC5kc3MgKGZsYWdzIDB4M2MwKQovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9i
cmlkZ2UtaGRtaUAzYiBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9k
c3NAMzAyMDAwMDAKLS0tLS0gY3ljbGU6IHN0YXJ0IC0tLS0tCi9idXNAZjAwMDAvZHNzQDMw
MjAwMDAwOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9icmlk
Z2UtaGRtaUAzYgovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMDogY3ljbGU6IGRlcGVuZHMgb24g
L2J1c0BmMDAwMC9kc3NAMzAyMDAwMDAKL2J1c0BmMDAwMC9pMmNAMjAwMTAwMDAvZ3Bpb0Ay
MjogY3ljbGU6IGNoaWxkIG9mIC9idXNAZjAwMDAvaTJjQDIwMDEwMDAwCi9idXNAZjAwMDAv
aTJjQDIwMDEwMDAwL2JyaWRnZS1oZG1pQDNiOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYw
MDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyCi0tLS0tIGN5Y2xlOiBlbmQgLS0tLS0KL2J1c0Bm
MDAwMC9pMmNAMjAwMTAwMDAvYnJpZGdlLWhkbWlAM2I6IEZpeGVkIGRlcGVuZGVuY3kgY3lj
bGUocykgd2l0aCAvYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyCmRldmljZTogJzEt
MDAyMic6IGRldmljZV9hZGQKZGV2aWNlOiAnaTJjOjEtMDAyMi0tcGxhdGZvcm06cmVndWxh
dG9yLTMnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIHJlZ3VsYXRvci0zIHRv
IGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGZhMDAwMDAubW1jIHRvIGVuZCBv
ZiBsaXN0CnBsYXRmb3JtIHJlZ3VsYXRvci0zOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byAx
LTAwMjIKL3JlZ3VsYXRvci0zIERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYw
MDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyCmRldmljZTogJ2kyYzoxLTAwMjItLWkyYzoxLTAw
M2InOiBkZXZpY2VfYWRkCmkyYyAxLTAwM2I6IExpbmtlZCBhcyBhIHN5bmMgc3RhdGUgb25s
eSBjb25zdW1lciB0byAxLTAwMjIgKGZsYWdzIDB4M2MwKQovYnVzQGYwMDAwL2kyY0AyMDAx
MDAwMC9icmlkZ2UtaGRtaUAzYiBEcm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0Bm
MDAwMC9pMmNAMjAwMTAwMDAvZ3Bpb0AyMgpkZXZpY2U6ICdwbGF0Zm9ybTpmNDAwMC5waW5j
dHJsLS1pMmM6MS0wMDIyJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAxLTAw
MjIgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVndWxhdG9yLTMgdG8g
ZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9m
IGxpc3QKaTJjIDEtMDAyMjogTGlua2VkIGFzIGEgY29uc3VtZXIgdG8gZjQwMDAucGluY3Ry
bAovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyIERyb3BwaW5nIHRoZSBmd25vZGUg
bGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAKZGV2aWNlOiAncGxhdGZvcm06NjAx
MDAwLmdwaW8tLWkyYzoxLTAwMjInOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5n
IDEtMDAyMiB0byBlbmQgb2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyByZWd1bGF0b3It
MyB0byBlbmQgb2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1tYyB0byBl
bmQgb2YgbGlzdAppMmMgMS0wMDIyOiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA2MDEwMDAu
Z3BpbwovYnVzQGYwMDAwL2kyY0AyMDAxMDAwMC9ncGlvQDIyIERyb3BwaW5nIHRoZSBmd25v
ZGUgbGluayB0byAvYnVzQGYwMDAwL2dwaW9ANjAxMDAwCmkyYyAxLTAwMjI6IGVycm9yIC1F
UFJPQkVfREVGRVI6IHN1cHBsaWVyIDYwMTAwMC5ncGlvIG5vdCByZWFkeQpvbWFwX2kyYyAy
MDAxMDAwMC5pMmM6IGJ1cyAxIHJldjAuMTIgYXQgMTAwIGtIegpvbWFwX2kyYyAyMDAxMDAw
MC5pMmM6IERyb3BwaW5nIHRoZSBsaW5rIHRvIDYwMTAwMC5ncGlvCmRldmljZTogJ3BsYXRm
b3JtOjYwMTAwMC5ncGlvLS1wbGF0Zm9ybToyMDAxMDAwMC5pMmMnOiBkZXZpY2VfdW5yZWdp
c3RlcgpvbWFwX2kyYyAyMDAxMDAwMC5pMmM6IERyb3BwaW5nIHRoZSBsaW5rIHRvIDMwMjAw
MDAwLmRzcwpkZXZpY2U6ICdwbGF0Zm9ybTozMDIwMDAwMC5kc3MtLXBsYXRmb3JtOjIwMDEw
MDAwLmkyYyc6IGRldmljZV91bnJlZ2lzdGVyCm9tYXBfaTJjIDIwMDEwMDAwLmkyYzogRHJv
cHBpbmcgdGhlIGxpbmsgdG8gY29ubmVjdG9yLWhkbWkKZGV2aWNlOiAncGxhdGZvcm06Y29u
bmVjdG9yLWhkbWktLXBsYXRmb3JtOjIwMDEwMDAwLmkyYyc6IGRldmljZV91bnJlZ2lzdGVy
Cm9tYXBfaTJjIDIwMDEwMDAwLmkyYzogRHJvcHBpbmcgdGhlIGxpbmsgdG8gcmVndWxhdG9y
LTIKZGV2aWNlOiAncGxhdGZvcm06cmVndWxhdG9yLTItLXBsYXRmb3JtOjIwMDEwMDAwLmky
Yyc6IGRldmljZV91bnJlZ2lzdGVyCm9tYXBfaTJjIDIwMDEwMDAwLmkyYzogRHJvcHBpbmcg
dGhlIGxpbmsgdG8gcmVndWxhdG9yLTUKZGV2aWNlOiAncGxhdGZvcm06cmVndWxhdG9yLTUt
LXBsYXRmb3JtOjIwMDEwMDAwLmkyYyc6IGRldmljZV91bnJlZ2lzdGVyCmRldmljZXNfa3Nl
dDogTW92aW5nIDIwMDIwMDAwLmkyYyB0byBlbmQgb2YgbGlzdApkZXZpY2U6ICdpMmMtMic6
IGRldmljZV9hZGQKZGV2aWNlOiAnaTJjLTInOiBkZXZpY2VfYWRkCm9tYXBfaTJjIDIwMDIw
MDAwLmkyYzogYnVzIDIgcmV2MC4xMiBhdCA0MDAga0h6CmRldmljZXNfa3NldDogTW92aW5n
IHJlZ3VsYXRvci0zIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGZhMDAw
MDAubW1jIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIHJlZ3VsYXRvci01
IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDEtMDAxYiB0byBlbmQgb2Yg
bGlzdApwbGF0Zm9ybSByZWd1bGF0b3ItMzogZXJyb3IgLUVQUk9CRV9ERUZFUjogc3VwcGxp
ZXIgMS0wMDIyIG5vdCByZWFkeQpkZXZpY2VzX2tzZXQ6IE1vdmluZyBidXNAZjAwMDA6aW50
ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDog
TW92aW5nIDYwMDAwMC5ncGlvIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5n
IHJlZ3VsYXRvci00IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGZhMDAw
MDAubW1jIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDYwMTAwMC5ncGlv
IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDEtMDAyMiB0byBlbmQgb2Yg
bGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyByZWd1bGF0b3ItMyB0byBlbmQgb2YgbGlzdApk
ZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1tYyB0byBlbmQgb2YgbGlzdAp0aS1zY2kt
aW50ciBidXNAZjAwMDA6aW50ZXJydXB0LWNvbnRyb2xsZXJAYTAwMDAwOiBJbnRlcnJ1cHQg
Um91dGVyIDMgZG9tYWluIGNyZWF0ZWQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgNDgwMDAwMDAu
aW50ZXJydXB0LWNvbnRyb2xsZXIgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgNDg1YzAxMDAuZG1hLWNvbnRyb2xsZXIgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0
OiBNb3ZpbmcgNDg1YzAwMDAuZG1hLWNvbnRyb2xsZXIgdG8gZW5kIG9mIGxpc3QKZGV2aWNl
OiAncmVndWxhdG9yLjQnOiBkZXZpY2VfYWRkCnRpLXNjaS1pbnRhIDQ4MDAwMDAwLmludGVy
cnVwdC1jb250cm9sbGVyOiBJbnRlcnJ1cHQgQWdncmVnYXRvciBkb21haW4gMjggY3JlYXRl
ZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAyYjMwMDA1MC50YXJnZXQtbW9kdWxlIHRvIGVuZCBv
ZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGxlZHMgdG8gZW5kIG9mIGxpc3QKbGVkcy1n
cGlvIGxlZHM6IGVycm9yIC1FUFJPQkVfREVGRVI6IEZhaWxlZCB0byBnZXQgR1BJTyAnL2xl
ZHMvbGVkLTAnCmRldmljZXNfa3NldDogTW92aW5nIDEwODJlMC5jbG9jay1jb250cm9sbGVy
IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDEwODJlNC5jbG9jay1jb250
cm9sbGVyIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDQ4NWMwMTAwLmRt
YS1jb250cm9sbGVyIHRvIGVuZCBvZiBsaXN0CnRpLXVkbWEgNDg1YzAxMDAuZG1hLWNvbnRy
b2xsZXI6IE51bWJlciBvZiByaW5nczogODIKdGktdWRtYSA0ODVjMDEwMC5kbWEtY29udHJv
bGxlcjogQ2hhbm5lbHM6IDQ4IChiY2hhbjogMTgsIHRjaGFuOiAxMiwgcmNoYW46IDE4KQpk
ZXZpY2U6ICdkbWEwY2hhbjAnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMSc6IGRl
dmljZV9hZGQKZGV2aWNlOiAnZG1hMGNoYW4yJzogZGV2aWNlX2FkZApkZXZpY2U6ICdkbWEw
Y2hhbjMnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuNCc6IGRldmljZV9hZGQKZGV2
aWNlOiAnZG1hMGNoYW41JzogZGV2aWNlX2FkZApkZXZpY2U6ICdkbWEwY2hhbjYnOiBkZXZp
Y2VfYWRkCmRldmljZTogJ2RtYTBjaGFuNyc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMGNo
YW44JzogZGV2aWNlX2FkZApkZXZpY2U6ICdkbWEwY2hhbjknOiBkZXZpY2VfYWRkCmRldmlj
ZTogJ2RtYTBjaGFuMTAnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMTEnOiBkZXZp
Y2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMTInOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBj
aGFuMTMnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMTQnOiBkZXZpY2VfYWRkCmRl
dmljZTogJ2RtYTBjaGFuMTUnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMTYnOiBk
ZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMTcnOiBkZXZpY2VfYWRkCmRldmljZTogJ2Rt
YTBjaGFuMTgnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMTknOiBkZXZpY2VfYWRk
CmRldmljZTogJ2RtYTBjaGFuMjAnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMjEn
OiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMjInOiBkZXZpY2VfYWRkCmRldmljZTog
J2RtYTBjaGFuMjMnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMjQnOiBkZXZpY2Vf
YWRkCmRldmljZTogJ2RtYTBjaGFuMjUnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFu
MjYnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMjcnOiBkZXZpY2VfYWRkCmRldmlj
ZTogJ2RtYTBjaGFuMjgnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMjknOiBkZXZp
Y2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMzAnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBj
aGFuMzEnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMzInOiBkZXZpY2VfYWRkCmRl
dmljZTogJ2RtYTBjaGFuMzMnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMzQnOiBk
ZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMzUnOiBkZXZpY2VfYWRkCmRldmljZTogJ2Rt
YTBjaGFuMzYnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMzcnOiBkZXZpY2VfYWRk
CmRldmljZTogJ2RtYTBjaGFuMzgnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuMzkn
OiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuNDAnOiBkZXZpY2VfYWRkCmRldmljZTog
J2RtYTBjaGFuNDEnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuNDInOiBkZXZpY2Vf
YWRkCmRldmljZTogJ2RtYTBjaGFuNDMnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFu
NDQnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuNDUnOiBkZXZpY2VfYWRkCmRldmlj
ZTogJ2RtYTBjaGFuNDYnOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTBjaGFuNDcnOiBkZXZp
Y2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDQ4NWMwMDAwLmRtYS1jb250cm9sbGVyIHRv
IGVuZCBvZiBsaXN0CnRpLXVkbWEgNDg1YzAwMDAuZG1hLWNvbnRyb2xsZXI6IE51bWJlciBv
ZiByaW5nczogMTUwCnRpLXVkbWEgNDg1YzAwMDAuZG1hLWNvbnRyb2xsZXI6IENoYW5uZWxz
OiAzNSAodGNoYW46IDIwLCByY2hhbjogMTUpCmRldmljZTogJ2RtYTFjaGFuMCc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4xJzogZGV2aWNlX2FkZApkZXZpY2U6ICdkbWExY2hh
bjInOiBkZXZpY2VfYWRkCmRldmljZTogJ2RtYTFjaGFuMyc6IGRldmljZV9hZGQKZGV2aWNl
OiAnZG1hMWNoYW40JzogZGV2aWNlX2FkZApkZXZpY2U6ICdkbWExY2hhbjUnOiBkZXZpY2Vf
YWRkCmRldmljZTogJ2RtYTFjaGFuNic6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW43
JzogZGV2aWNlX2FkZApkZXZpY2U6ICdkbWExY2hhbjgnOiBkZXZpY2VfYWRkCmRldmljZTog
J2RtYTFjaGFuOSc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4xMCc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnZG1hMWNoYW4xMSc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4x
Mic6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4xMyc6IGRldmljZV9hZGQKZGV2aWNl
OiAnZG1hMWNoYW4xNCc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4xNSc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4xNic6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNo
YW4xNyc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4xOCc6IGRldmljZV9hZGQKZGV2
aWNlOiAnZG1hMWNoYW4xOSc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4yMCc6IGRl
dmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4yMSc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1h
MWNoYW4yMic6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4yMyc6IGRldmljZV9hZGQK
ZGV2aWNlOiAnZG1hMWNoYW4yNCc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4yNSc6
IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4yNic6IGRldmljZV9hZGQKZGV2aWNlOiAn
ZG1hMWNoYW4yNyc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4yOCc6IGRldmljZV9h
ZGQKZGV2aWNlOiAnZG1hMWNoYW4yOSc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4z
MCc6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4zMSc6IGRldmljZV9hZGQKZGV2aWNl
OiAnZG1hMWNoYW4zMic6IGRldmljZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4zMyc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAnZG1hMWNoYW4zNCc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBN
b3ZpbmcgMjgwMDAwMC5zZXJpYWwgdG8gZW5kIG9mIGxpc3QKZGV2aWNlOiAndHR5UzInOiBk
ZXZpY2VfdW5yZWdpc3RlcgpwcmludGs6IGxlZ2FjeSBjb25zb2xlIFt0dHlTMl0gZGlzYWJs
ZWQKZGV2aWNlOiAnMjgwMDAwMC5zZXJpYWw6MCc6IGRldmljZV9hZGQKZGV2aWNlOiAnMjgw
MDAwMC5zZXJpYWw6MC4wJzogZGV2aWNlX2FkZAoyODAwMDAwLnNlcmlhbDogdHR5UzIgYXQg
TU1JTyAweDI4MDAwMDAgKGlycSA9IDIzNywgYmFzZV9iYXVkID0gMzAwMDAwMCkgaXMgYSA4
MjUwCnByaW50azogbGVnYWN5IGNvbnNvbGUgW3R0eVMyXSBlbmFibGVkCmRldmljZTogJ3Nl
cmlhbDAnOiBkZXZpY2VfYWRkCmRldmljZTogJ3R0eVMyJzogZGV2aWNlX2FkZApkZXZpY2Vz
X2tzZXQ6IE1vdmluZyBmYzQwMDAwLnNwaSB0byBlbmQgb2YgbGlzdApkZXZpY2U6ICdzcGkw
JzogZGV2aWNlX2FkZApkZXZpY2U6ICdzcGkwLjAnOiBkZXZpY2VfYWRkCjcgZml4ZWQtcGFy
dGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1URCBkZXZpY2UgZmM0MDAwMC5zcGkuMApD
cmVhdGluZyA3IE1URCBwYXJ0aXRpb25zIG9uICJmYzQwMDAwLnNwaS4wIjoKMHgwMDAwMDAw
MDAwMDAtMHgwMDAwMDAwODAwMDAgOiAib3NwaS50aWJvb3QzIgpkZXZpY2U6ICdtdGQwJzog
ZGV2aWNlX2FkZApkZXZpY2U6ICdtdGQwJzogZGV2aWNlX2FkZApkZXZpY2U6ICdtdGQwcm8n
OiBkZXZpY2VfYWRkCmRldmljZTogJ210ZGJsb2NrMCc6IGRldmljZV9hZGQKZGV2aWNlOiAn
MzE6MCc6IGRldmljZV9hZGQKMHgwMDAwMDAwODAwMDAtMHgwMDAwMDAyODAwMDAgOiAib3Nw
aS50aXNwbCIKZGV2aWNlOiAnbXRkMSc6IGRldmljZV9hZGQKZGV2aWNlOiAnbXRkMSc6IGRl
dmljZV9hZGQKZGV2aWNlOiAnbXRkMXJvJzogZGV2aWNlX2FkZApkZXZpY2U6ICdtdGRibG9j
azEnOiBkZXZpY2VfYWRkCmRldmljZTogJzMxOjEnOiBkZXZpY2VfYWRkCjB4MDAwMDAwMjgw
MDAwLTB4MDAwMDAwNjgwMDAwIDogIm9zcGkudS1ib290IgpkZXZpY2U6ICdtdGQyJzogZGV2
aWNlX2FkZApkZXZpY2U6ICdtdGQyJzogZGV2aWNlX2FkZApkZXZpY2U6ICdtdGQycm8nOiBk
ZXZpY2VfYWRkCmRldmljZTogJ210ZGJsb2NrMic6IGRldmljZV9hZGQKZGV2aWNlOiAnMzE6
Mic6IGRldmljZV9hZGQKMHgwMDAwMDA2ODAwMDAtMHgwMDAwMDA2YzAwMDAgOiAib3NwaS5l
bnYiCmRldmljZTogJ210ZDMnOiBkZXZpY2VfYWRkCmRldmljZTogJ210ZDMnOiBkZXZpY2Vf
YWRkCmRldmljZTogJ210ZDNybyc6IGRldmljZV9hZGQKZGV2aWNlOiAnbXRkYmxvY2szJzog
ZGV2aWNlX2FkZApkZXZpY2U6ICczMTozJzogZGV2aWNlX2FkZAoweDAwMDAwMDZjMDAwMC0w
eDAwMDAwMDcwMDAwMCA6ICJvc3BpLmVudi5iYWNrdXAiCmRldmljZTogJ210ZDQnOiBkZXZp
Y2VfYWRkCmRldmljZTogJ210ZDQnOiBkZXZpY2VfYWRkCmRldmljZTogJ210ZDRybyc6IGRl
dmljZV9hZGQKZGV2aWNlOiAnbXRkYmxvY2s0JzogZGV2aWNlX2FkZApkZXZpY2U6ICczMTo0
JzogZGV2aWNlX2FkZAoweDAwMDAwMDgwMDAwMC0weDAwMDAwM2ZjMDAwMCA6ICJvc3BpLnJv
b3RmcyIKZGV2aWNlOiAnbXRkNSc6IGRldmljZV9hZGQKZGV2aWNlOiAnbXRkNSc6IGRldmlj
ZV9hZGQKZGV2aWNlOiAnbXRkNXJvJzogZGV2aWNlX2FkZApkZXZpY2U6ICdtdGRibG9jazUn
OiBkZXZpY2VfYWRkCmRldmljZTogJzMxOjUnOiBkZXZpY2VfYWRkCjB4MDAwMDAzZmMwMDAw
LTB4MDAwMDA0MDAwMDAwIDogIm9zcGkucGh5cGF0dGVybiIKZGV2aWNlOiAnbXRkNic6IGRl
dmljZV9hZGQKZGV2aWNlOiAnbXRkNic6IGRldmljZV9hZGQKZGV2aWNlOiAnbXRkNnJvJzog
ZGV2aWNlX2FkZApkZXZpY2U6ICdtdGRibG9jazYnOiBkZXZpY2VfYWRkCmRldmljZTogJzMx
OjYnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDgwMDAwMDAuZXRoZXJuZXQg
dG8gZW5kIG9mIGxpc3QKZGV2aWNlOiAnODAwMGYwMC5tZGlvJzogZGV2aWNlX2FkZApkZXZp
Y2U6ICdwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTo4MDAwZjAwLm1kaW8nOiBk
ZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDgwMDBmMDAubWRpbyB0byBlbmQgb2Yg
bGlzdApwbGF0Zm9ybSA4MDAwZjAwLm1kaW86IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIGY0
MDAwLnBpbmN0cmwKL2J1c0BmMDAwMC9ldGhlcm5ldEA4MDAwMDAwL21kaW9AZjAwIERyb3Bw
aW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL3BpbmN0cmxAZjQwMDAKZGV2aWNl
OiAncGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxl
ci0tcGxhdGZvcm06ODAwMGYwMC5tZGlvJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1v
dmluZyA4MDAwZjAwLm1kaW8gdG8gZW5kIG9mIGxpc3QKcGxhdGZvcm0gODAwMGYwMC5tZGlv
OiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byA0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpj
bG9jay1jb250cm9sbGVyCi9idXNAZjAwMDAvZXRoZXJuZXRAODAwMDAwMC9tZGlvQGYwMCBE
cm9wcGluZyB0aGUgZndub2RlIGxpbmsgdG8gL2J1c0BmMDAwMC9zeXN0ZW0tY29udHJvbGxl
ckA0NDA0MzAwMC9jbG9jay1jb250cm9sbGVyCmRhdmluY2lfbWRpbyA4MDAwZjAwLm1kaW86
IENvbmZpZ3VyaW5nIE1ESU8gaW4gbWFudWFsIG1vZGUKZGV2aWNlOiAnODAwMGYwMC5tZGlv
JzogZGV2aWNlX2FkZApkYXZpbmNpX21kaW8gODAwMGYwMC5tZGlvOiBkYXZpbmNpIG1kaW8g
cmV2aXNpb24gOS43LCBidXMgZnJlcSAxMDAwMDAwCmRldmljZTogJzgwMDBmMDAubWRpbzow
MCc6IGRldmljZV9hZGQKZGV2aWNlOiAnODAwMGYwMC5tZGlvOjAxJzogZGV2aWNlX2FkZApk
YXZpbmNpX21kaW8gODAwMGYwMC5tZGlvOiBwaHlbMF06IGRldmljZSA4MDAwZjAwLm1kaW86
MDAsIGRyaXZlciBUSSBEUDgzODY3CmRhdmluY2lfbWRpbyA4MDAwZjAwLm1kaW86IHBoeVsx
XTogZGV2aWNlIDgwMDBmMDAubWRpbzowMSwgZHJpdmVyIFRJIERQODM4NjcKYW02NS1jcHN3
LW51c3MgODAwMDAwMC5ldGhlcm5ldDogaW5pdGlhbGl6aW5nIGFtNjUgY3BzdyBudXNzIHZl
cnNpb24gMHg2QkEwMTEwMywgY3BzdyB2ZXJzaW9uIDB4NkJBODExMDMgUG9ydHM6IDMgcXVp
cmtzOjAwMDAwMDAyCmRldmljZTogJ3BoeTpwaHktMTA0MDQ0LnBoeS4wLS1wbGF0Zm9ybTo4
MDAwMDAwLmV0aGVybmV0JzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyA4MDAw
MDAwLmV0aGVybmV0IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDgwMDBm
MDAubWRpbyB0byBlbmQgb2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyA4MDAwZjAwLm1k
aW8gdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgODAwMGYwMC5tZGlvOjAw
IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDgwMDBmMDAubWRpbzowMSB0
byBlbmQgb2YgbGlzdAphbTY1LWNwc3ctbnVzcyA4MDAwMDAwLmV0aGVybmV0OiBMaW5rZWQg
YXMgYSBjb25zdW1lciB0byBwaHktMTA0MDQ0LnBoeS4wCmRldmljZTogJ3BoeTpwaHktMTA0
MDQ0LnBoeS4xLS1wbGF0Zm9ybTo4MDAwMDAwLmV0aGVybmV0JzogZGV2aWNlX2FkZApkZXZp
Y2VzX2tzZXQ6IE1vdmluZyA4MDAwMDAwLmV0aGVybmV0IHRvIGVuZCBvZiBsaXN0CmRldmlj
ZXNfa3NldDogTW92aW5nIDgwMDBmMDAubWRpbyB0byBlbmQgb2YgbGlzdApkZXZpY2VzX2tz
ZXQ6IE1vdmluZyA4MDAwZjAwLm1kaW8gdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBN
b3ZpbmcgODAwMGYwMC5tZGlvOjAwIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92
aW5nIDgwMDBmMDAubWRpbzowMSB0byBlbmQgb2YgbGlzdAphbTY1LWNwc3ctbnVzcyA4MDAw
MDAwLmV0aGVybmV0OiBMaW5rZWQgYXMgYSBjb25zdW1lciB0byBwaHktMTA0MDQ0LnBoeS4x
CmFtNjUtY3Bzdy1udXNzIDgwMDAwMDAuZXRoZXJuZXQ6IGluaXRpYWxpemVkIGNwc3cgYWxl
IHZlcnNpb24gMS41CmFtNjUtY3Bzdy1udXNzIDgwMDAwMDAuZXRoZXJuZXQ6IEFMRSBUYWJs
ZSBzaXplIDUxMiwgUG9saWNlcnMgMzIKZGV2aWNlOiAndGNoYW4xOS0weGM2MDAnOiBkZXZp
Y2VfYWRkCmRldmljZTogJ3RjaGFuMjAtMHhjNjAxJzogZGV2aWNlX2FkZApkZXZpY2U6ICd0
Y2hhbjIxLTB4YzYwMic6IGRldmljZV9hZGQKZGV2aWNlOiAndGNoYW4yMi0weGM2MDMnOiBk
ZXZpY2VfYWRkCmRldmljZTogJ3RjaGFuMjMtMHhjNjA0JzogZGV2aWNlX2FkZApkZXZpY2U6
ICd0Y2hhbjI0LTB4YzYwNSc6IGRldmljZV9hZGQKZGV2aWNlOiAndGNoYW4yNS0weGM2MDYn
OiBkZXZpY2VfYWRkCmRldmljZTogJ3RjaGFuMjYtMHhjNjA3JzogZGV2aWNlX2FkZApkZXZp
Y2U6ICdyY2hhbjE5LTB4NDYwMCc6IGRldmljZV9hZGQKYW02NS1jcHN3LW51c3MgODAwMDAw
MC5ldGhlcm5ldDogc2V0IG5ldyBmbG93LWlkLWJhc2UgMTkKZGV2aWNlOiAnZXRoMCc6IGRl
dmljZV9hZGQKZGV2aWNlOiAnZXRoMSc6IGRldmljZV9hZGQKYW02NS1jcHN3LW51c3MgODAw
MDAwMC5ldGhlcm5ldDogRHJvcHBpbmcgdGhlIGxpbmsgdG8gMTA0MDQ0LnBoeQpkZXZpY2U6
ICdwbGF0Zm9ybToxMDQwNDQucGh5LS1wbGF0Zm9ybTo4MDAwMDAwLmV0aGVybmV0JzogZGV2
aWNlX3VucmVnaXN0ZXIKYW02NS1jcHN3LW51c3MgODAwMDAwMC5ldGhlcm5ldDogRHJvcHBp
bmcgdGhlIGxpbmsgdG8gYnVzQGYwMDAwCmRldmljZTogJ3BsYXRmb3JtOmJ1c0BmMDAwMC0t
cGxhdGZvcm06ODAwMDAwMC5ldGhlcm5ldCc6IGRldmljZV91bnJlZ2lzdGVyCmRldmljZXNf
a3NldDogTW92aW5nIGY5MDAwMDAuZHdjMy11c2IgdG8gZW5kIG9mIGxpc3QKZGV2aWNlOiAn
MzEwMDAwMDAudXNiJzogZGV2aWNlX2FkZAotLS0tLSBjeWNsZTogc3RhcnQgLS0tLS0KL2J1
c0BmMDAwMC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMDogY3ljbGU6IGRlcGVuZHMg
b24gL2J1c0BmMDAwMC9pMmNAMjAwMDAwMDAvdHBzNjU5OHhAM2YvY29ubmVjdG9yCi9idXNA
ZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nvbm5lY3RvcjogY3ljbGU6IGRlcGVu
ZHMgb24gL2J1c0BmMDAwMC9kd2MzLXVzYkBmOTAwMDAwL3VzYkAzMTAwMDAwMAotLS0tLSBj
eWNsZTogZW5kIC0tLS0tCi9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nv
bm5lY3RvcjogRml4ZWQgZGVwZW5kZW5jeSBjeWNsZShzKSB3aXRoIC9idXNAZjAwMDAvZHdj
My11c2JAZjkwMDAwMC91c2JAMzEwMDAwMDAKZGV2aWNlOiAncGxhdGZvcm06MzEwMDAwMDAu
dXNiLS1pMmM6MC0wMDNmJzogZGV2aWNlX2FkZAppMmMgMC0wMDNmOiBMaW5rZWQgYXMgYSBz
eW5jIHN0YXRlIG9ubHkgY29uc3VtZXIgdG8gMzEwMDAwMDAudXNiIChmbGFncyAweDNjMCkK
ZGV2aWNlOiAncGxhdGZvcm06YnVzQGYwMDAwLS1wbGF0Zm9ybTozMTAwMDAwMC51c2InOiBk
ZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDMxMDAwMDAwLnVzYiB0byBlbmQgb2Yg
bGlzdApwbGF0Zm9ybSAzMTAwMDAwMC51c2I6IExpbmtlZCBhcyBhIGNvbnN1bWVyIHRvIGJ1
c0BmMDAwMAovYnVzQGYwMDAwL2R3YzMtdXNiQGY5MDAwMDAvdXNiQDMxMDAwMDAwIERyb3Bw
aW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwCi0tLS0tIGN5Y2xlOiBzdGFydCAt
LS0tLQovYnVzQGYwMDAwL2kyY0AyMDAwMDAwMC90cHM2NTk4eEAzZi9jb25uZWN0b3I6IGN5
Y2xlOiBkZXBlbmRzIG9uIC9idXNAZjAwMDAvZHdjMy11c2JAZjkwMDAwMC91c2JAMzEwMDAw
MDAKLS0tLS0gY3ljbGU6IHN0YXJ0IC0tLS0tCi9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3Rw
czY1OTh4QDNmOiBjeWNsZTogZGVwZW5kcyBvbiAvYnVzQGYwMDAwL2R3YzMtdXNiQGY5MDAw
MDAvdXNiQDMxMDAwMDAwCi9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nv
bm5lY3RvcjogY3ljbGU6IGNoaWxkIG9mIC9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1
OTh4QDNmCi9idXNAZjAwMDAvZHdjMy11c2JAZjkwMDAwMC91c2JAMzEwMDAwMDA6IGN5Y2xl
OiBkZXBlbmRzIG9uIC9idXNAZjAwMDAvaTJjQDIwMDAwMDAwL3RwczY1OTh4QDNmL2Nvbm5l
Y3RvcgotLS0tLSBjeWNsZTogZW5kIC0tLS0tCi9idXNAZjAwMDAvZHdjMy11c2JAZjkwMDAw
MC91c2JAMzEwMDAwMDA6IEZpeGVkIGRlcGVuZGVuY3kgY3ljbGUocykgd2l0aCAvYnVzQGYw
MDAwL2kyY0AyMDAwMDAwMC90cHM2NTk4eEAzZi9jb25uZWN0b3IKZHdjMyAzMTAwMDAwMC51
c2I6IENvbmZpZ3VyYXRpb24gbWlzbWF0Y2guIGRyX21vZGUgZm9yY2VkIHRvIGhvc3QKZGV2
aWNlOiAneGhjaS1oY2QuMC5hdXRvJzogZGV2aWNlX2FkZAp4aGNpLWhjZCB4aGNpLWhjZC4w
LmF1dG86IHhIQ0kgSG9zdCBDb250cm9sbGVyCnhoY2ktaGNkIHhoY2ktaGNkLjAuYXV0bzog
bmV3IFVTQiBidXMgcmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAxCnhoY2ktaGNk
IHhoY2ktaGNkLjAuYXV0bzogVVNCMyByb290IGh1YiBoYXMgbm8gcG9ydHMKeGhjaS1oY2Qg
eGhjaS1oY2QuMC5hdXRvOiBoY2MgcGFyYW1zIDB4MDI1OGZlNmQgaGNpIHZlcnNpb24gMHgx
MTAgcXVpcmtzIDB4MDAwMDgwODAyMDAwMDAxMAp4aGNpLWhjZCB4aGNpLWhjZC4wLmF1dG86
IGlycSAyNDAsIGlvIG1lbSAweDMxMDAwMDAwCmRldmljZTogJ3VzYjEnOiBkZXZpY2VfYWRk
CmRldmljZTogJzEtMDoxLjAnOiBkZXZpY2VfYWRkCmh1YiAxLTA6MS4wOiBVU0IgaHViIGZv
dW5kCmh1YiAxLTA6MS4wOiAxIHBvcnQgZGV0ZWN0ZWQKZGV2aWNlOiAndXNiMS1wb3J0MSc6
IGRldmljZV9hZGQKZGV2aWNlOiAnZXBfODEnOiBkZXZpY2VfYWRkCmRldmljZTogJ2VwXzAw
JzogZGV2aWNlX2FkZAovYnVzQGYwMDAwL2R3YzMtdXNiQGY5MDAwMDAvdXNiQDMxMDAwMDAw
IERyb3BwaW5nIHRoZSBmd25vZGUgbGluayB0byAvYnVzQGYwMDAwL2kyY0AyMDAwMDAwMC90
cHM2NTk4eEAzZi9jb25uZWN0b3IKZGV2aWNlOiAnd2FrZXVwMCc6IGRldmljZV9hZGQKZHdj
My1hbTYyIGY5MDAwMDAuZHdjMy11c2I6IERyb3BwaW5nIHRoZSBsaW5rIHRvIGJ1c0BmMDAw
MApkZXZpY2U6ICdwbGF0Zm9ybTpidXNAZjAwMDAtLXBsYXRmb3JtOmY5MDAwMDAuZHdjMy11
c2InOiBkZXZpY2VfdW5yZWdpc3RlcgpkZXZpY2VzX2tzZXQ6IE1vdmluZyBmOTEwMDAwLmR3
YzMtdXNiIHRvIGVuZCBvZiBsaXN0CmRldmljZTogJzMxMTAwMDAwLnVzYic6IGRldmljZV9h
ZGQKZGV2aWNlOiAncGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxhdGZvcm06MzExMDAwMDAu
dXNiJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6IE1vdmluZyAzMTEwMDAwMC51c2IgdG8g
ZW5kIG9mIGxpc3QKcGxhdGZvcm0gMzExMDAwMDAudXNiOiBMaW5rZWQgYXMgYSBjb25zdW1l
ciB0byBmNDAwMC5waW5jdHJsCi9idXNAZjAwMDAvZHdjMy11c2JAZjkxMDAwMC91c2JAMzEx
MDAwMDAgRHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAvcGluY3RybEBm
NDAwMApkZXZpY2U6ICdwbGF0Zm9ybTpidXNAZjAwMDAtLXBsYXRmb3JtOjMxMTAwMDAwLnVz
Yic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMzExMDAwMDAudXNiIHRvIGVu
ZCBvZiBsaXN0CnBsYXRmb3JtIDMxMTAwMDAwLnVzYjogTGlua2VkIGFzIGEgY29uc3VtZXIg
dG8gYnVzQGYwMDAwCi9idXNAZjAwMDAvZHdjMy11c2JAZjkxMDAwMC91c2JAMzExMDAwMDAg
RHJvcHBpbmcgdGhlIGZ3bm9kZSBsaW5rIHRvIC9idXNAZjAwMDAKZGV2aWNlOiAneGhjaS1o
Y2QuMS5hdXRvJzogZGV2aWNlX2FkZAp4aGNpLWhjZCB4aGNpLWhjZC4xLmF1dG86IHhIQ0kg
SG9zdCBDb250cm9sbGVyCnhoY2ktaGNkIHhoY2ktaGNkLjEuYXV0bzogbmV3IFVTQiBidXMg
cmVnaXN0ZXJlZCwgYXNzaWduZWQgYnVzIG51bWJlciAyCnhoY2ktaGNkIHhoY2ktaGNkLjEu
YXV0bzogVVNCMyByb290IGh1YiBoYXMgbm8gcG9ydHMKeGhjaS1oY2QgeGhjaS1oY2QuMS5h
dXRvOiBoY2MgcGFyYW1zIDB4MDI1OGZlNmQgaGNpIHZlcnNpb24gMHgxMTAgcXVpcmtzIDB4
MDAwMDgwODAyMDAwMDAxMAp4aGNpLWhjZCB4aGNpLWhjZC4xLmF1dG86IGlycSAyNDEsIGlv
IG1lbSAweDMxMTAwMDAwCmRldmljZTogJ3VzYjInOiBkZXZpY2VfYWRkCmRldmljZTogJzIt
MDoxLjAnOiBkZXZpY2VfYWRkCmh1YiAyLTA6MS4wOiBVU0IgaHViIGZvdW5kCmh1YiAyLTA6
MS4wOiAxIHBvcnQgZGV0ZWN0ZWQKZGV2aWNlOiAndXNiMi1wb3J0MSc6IGRldmljZV9hZGQK
ZGV2aWNlOiAnZXBfODEnOiBkZXZpY2VfYWRkCmRldmljZTogJ2VwXzAwJzogZGV2aWNlX2Fk
ZApkZXZpY2U6ICd3YWtldXAxJzogZGV2aWNlX2FkZApkd2MzLWFtNjIgZjkxMDAwMC5kd2Mz
LXVzYjogRHJvcHBpbmcgdGhlIGxpbmsgdG8gYnVzQGYwMDAwCmRldmljZTogJ3BsYXRmb3Jt
OmJ1c0BmMDAwMC0tcGxhdGZvcm06ZjkxMDAwMC5kd2MzLXVzYic6IGRldmljZV91bnJlZ2lz
dGVyCmR3YzMtYW02MiBmOTEwMDAwLmR3YzMtdXNiOiBEcm9wcGluZyB0aGUgbGluayB0byBm
NDAwMC5waW5jdHJsCmRldmljZTogJ3BsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3Jt
OmY5MTAwMDAuZHdjMy11c2InOiBkZXZpY2VfdW5yZWdpc3RlcgpkZXZpY2VzX2tzZXQ6IE1v
dmluZyAyYjFmMDAwMC5ydGMgdG8gZW5kIG9mIGxpc3QKZGV2aWNlOiAnd2FrZXVwMic6IGRl
dmljZV9hZGQKZGV2aWNlOiAncnRjMCc6IGRldmljZV9hZGQKZGV2aWNlOiAnYWxhcm10aW1l
ci4yLmF1dG8nOiBkZXZpY2VfYWRkCmRldmljZTogJ3dha2V1cDMnOiBkZXZpY2VfYWRkCnJ0
Yy10aS1rMyAyYjFmMDAwMC5ydGM6IHJlZ2lzdGVyZWQgYXMgcnRjMApydGMtdGktazMgMmIx
ZjAwMDAucnRjOiBzZXR0aW5nIHN5c3RlbSBjbG9jayB0byAxOTcwLTAxLTAxVDAwOjAwOjE4
IFVUQyAoMTgpCmRldmljZTogJ3RpX2szX3J0Y19zY3JhdGNoMCc6IGRldmljZV9hZGQKZGV2
aWNlc19rc2V0OiBNb3ZpbmcgY3B1ZnJlcS1kdCB0byBlbmQgb2YgbGlzdApkZXZpY2U6ICdj
b29saW5nX2RldmljZTAnOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIDYwMDAw
MC5ncGlvIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIHJlZ3VsYXRvci00
IHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGZhMDAwMDAubW1jIHRvIGVu
ZCBvZiBsaXN0CmRldmljZTogJ2dwaW9jaGlwMCc6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0
OiBNb3ZpbmcgNjAxMDAwLmdwaW8gdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3Zp
bmcgMS0wMDIyIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIHJlZ3VsYXRv
ci0zIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGZhMDAwMDAubW1jIHRv
IGVuZCBvZiBsaXN0CmRldmljZTogJ2dwaW9jaGlwMSc6IGRldmljZV9hZGQKZGV2aWNlc19r
c2V0OiBNb3ZpbmcgcmVndWxhdG9yLTQgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBN
b3ZpbmcgZmEwMDAwMC5tbWMgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3Zpbmcg
MS0wMDNiIHRvIGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDEtMDAyMiB0byBl
bmQgb2YgbGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyByZWd1bGF0b3ItMyB0byBlbmQgb2Yg
bGlzdApkZXZpY2VzX2tzZXQ6IE1vdmluZyBmYTAwMDAwLm1tYyB0byBlbmQgb2YgbGlzdApw
Y2E5NTN4IDEtMDAyMjogc3VwcGx5IHZjYyBub3QgZm91bmQsIHVzaW5nIGR1bW15IHJlZ3Vs
YXRvcgpkZXZpY2U6ICdyZWd1bGF0b3IuNSc6IGRldmljZV9hZGQKZGV2aWNlOiAncmVndWxh
dG9yOnJlZ3VsYXRvci4wLS1pMmM6MS0wMDIyJzogZGV2aWNlX2FkZApkZXZpY2VzX2tzZXQ6
IE1vdmluZyAxLTAwMjIgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgcmVn
dWxhdG9yLTMgdG8gZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgZmEwMDAwMC5t
bWMgdG8gZW5kIG9mIGxpc3QKcGNhOTUzeCAxLTAwMjI6IExpbmtlZCBhcyBhIGNvbnN1bWVy
IHRvIHJlZ3VsYXRvci4wCnBjYTk1M3ggMS0wMDIyOiB1c2luZyBBSQpkZXZpY2U6ICdncGlv
Y2hpcDInOiBkZXZpY2VfYWRkCmRldmljZXNfa3NldDogTW92aW5nIHJlZ3VsYXRvci0zIHRv
IGVuZCBvZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIGZhMDAwMDAubW1jIHRvIGVuZCBv
ZiBsaXN0CmRldmljZXNfa3NldDogTW92aW5nIDJiMzAwMDUwLnRhcmdldC1tb2R1bGUgdG8g
ZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgbGVkcyB0byBlbmQgb2YgbGlzdApk
ZXZpY2U6ICdyZWd1bGF0b3IuNic6IGRldmljZV9hZGQKZGV2aWNlOiAnYW02Mi1zazpncmVl
bjpoZWFydGJlYXQnOiBkZXZpY2VfYWRkCmxlZHMtZ3BpbyBsZWRzOiBEcm9wcGluZyB0aGUg
bGluayB0byA2MDEwMDAuZ3BpbwpkZXZpY2U6ICdwbGF0Zm9ybTo2MDEwMDAuZ3Bpby0tcGxh
dGZvcm06bGVkcyc6IGRldmljZV91bnJlZ2lzdGVyCmRldmljZXNfa3NldDogTW92aW5nIDEt
MDAzYiB0byBlbmQgb2YgbGlzdApzaWk5MDJ4IDEtMDAzYjogc3VwcGx5IGlvdmNjIG5vdCBm
b3VuZCwgdXNpbmcgZHVtbXkgcmVndWxhdG9yCmRldmljZTogJ3JlZ3VsYXRvcjpyZWd1bGF0
b3IuMC0taTJjOjEtMDAzYic6IGRldmljZV9hZGQKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMS0w
MDNiIHRvIGVuZCBvZiBsaXN0CnNpaTkwMnggMS0wMDNiOiBMaW5rZWQgYXMgYSBjb25zdW1l
ciB0byByZWd1bGF0b3IuMApzaWk5MDJ4IDEtMDAzYjogc3VwcGx5IGN2Y2MxMiBub3QgZm91
bmQsIHVzaW5nIGR1bW15IHJlZ3VsYXRvcgpkZXZpY2U6ICdoZG1pLWF1ZGlvLWNvZGVjLjMu
YXV0byc6IGRldmljZV9hZGQKZGV2aWNlOiAnaTJjLTMnOiBkZXZpY2VfYWRkCmRldmljZTog
J2kyYy0zJzogZGV2aWNlX2FkZAppMmMgaTJjLTE6IEFkZGVkIG11bHRpcGxleGVkIGkyYyBi
dXMgMwpzaWk5MDJ4IDEtMDAzYjogRHJvcHBpbmcgdGhlIGxpbmsgdG8gY29ubmVjdG9yLWhk
bWkKZGV2aWNlOiAncGxhdGZvcm06Y29ubmVjdG9yLWhkbWktLWkyYzoxLTAwM2InOiBkZXZp
Y2VfdW5yZWdpc3RlcgpzaWk5MDJ4IDEtMDAzYjogRHJvcHBpbmcgdGhlIGxpbmsgdG8gMzAy
MDAwMDAuZHNzCmRldmljZTogJ3BsYXRmb3JtOjMwMjAwMDAwLmRzcy0taTJjOjEtMDAzYic6
IGRldmljZV91bnJlZ2lzdGVyCnNpaTkwMnggMS0wMDNiOiBEcm9wcGluZyB0aGUgbGluayB0
byAxLTAwMjIKZGV2aWNlOiAnaTJjOjEtMDAyMi0taTJjOjEtMDAzYic6IGRldmljZV91bnJl
Z2lzdGVyCmRldmljZXNfa3NldDogTW92aW5nIDJiMzAwMDUwLnRhcmdldC1tb2R1bGUgdG8g
ZW5kIG9mIGxpc3QKZGV2aWNlc19rc2V0OiBNb3ZpbmcgMmIzMDAwNTAudGFyZ2V0LW1vZHVs
ZSB0byBlbmQgb2YgbGlzdAphbTY1LWNwc3ctbnVzcyA4MDAwMDAwLmV0aGVybmV0IGV0aDA6
IFBIWSBbODAwMGYwMC5tZGlvOjAwXSBkcml2ZXIgW1RJIERQODM4NjddIChpcnE9UE9MTCkK
YW02NS1jcHN3LW51c3MgODAwMDAwMC5ldGhlcm5ldCBldGgwOiBjb25maWd1cmluZyBmb3Ig
cGh5L3JnbWlpLXJ4aWQgbGluayBtb2RlCmFtNjUtY3Bzdy1udXNzIDgwMDAwMDAuZXRoZXJu
ZXQgZXRoMDogTGluayBpcyBVcCAtIDFHYnBzL0Z1bGwgLSBmbG93IGNvbnRyb2wgb2ZmClNl
bmRpbmcgREhDUCByZXF1ZXN0cyAuLiwgT0sKSVAtQ29uZmlnOiBHb3QgREhDUCBhbnN3ZXIg
ZnJvbSAxOTIuMTY4Ljg5LjEsIG15IGFkZHJlc3MgaXMgMTkyLjE2OC44OS4xMDAKSVAtQ29u
ZmlnOiBDb21wbGV0ZToKICAgICBkZXZpY2U9ZXRoMCwgaHdhZGRyPTFjOjYzOjQ5OjBmOjYy
OjBlLCBpcGFkZHI9MTkyLjE2OC44OS4xMDAsIG1hc2s9MjU1LjI1NS4yNTUuMCwgZ3c9MTky
LjE2OC44OS4xCiAgICAgaG9zdD1idWlsZHJvb3QsIGRvbWFpbj1sYWIsIG5pcy1kb21haW49
KG5vbmUpCiAgICAgYm9vdHNlcnZlcj0xOTIuMTY4Ljg4LjIwLCByb290c2VydmVyPTE5Mi4x
NjguODguMjAsIHJvb3RwYXRoPQogICAgIG5hbWVzZXJ2ZXIwPTE5Mi4xNjguODkuMQogICAg
IG50cHNlcnZlcjA9MTkyLjE2OC44OS4xCmNsazogRGlzYWJsaW5nIHVudXNlZCBjbG9ja3MK
UE06IGdlbnBkOiBEaXNhYmxpbmcgdW51c2VkIHBvd2VyIGRvbWFpbnMKQUxTQSBkZXZpY2Ug
bGlzdDoKICBObyBzb3VuZGNhcmRzIGZvdW5kLgpkZXZpY2U6ICcwOjIyJzogZGV2aWNlX2Fk
ZApWRlM6IE1vdW50ZWQgcm9vdCAobmZzIGZpbGVzeXN0ZW0pIG9uIGRldmljZSAwOjIyLgpk
ZXZ0bXBmczogbW91bnRlZApGcmVlaW5nIHVudXNlZCBrZXJuZWwgbWVtb3J5OiA1ODg4SwpS
dW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKICB3aXRoIGFyZ3VtZW50czoKICAgIC9z
YmluL2luaXQKICB3aXRoIGVudmlyb25tZW50OgogICAgSE9NRT0vCiAgICBURVJNPWxpbnV4
CnVkZXZkWzEyMV06IHN0YXJ0aW5nIHZlcnNpb24gMy4yLjE0CnVkZXZkWzEyMl06IHN0YXJ0
aW5nIGV1ZGV2LTMuMi4xNApkZXZpY2U6ICcwOjI5JzogZGV2aWNlX2FkZAo=
--------------oyD0P5rhgVTVdKLZEq360Ft8
Content-Type: text/plain; charset=UTF-8; name="devlink-broken.txt"
Content-Disposition: attachment; filename="devlink-broken.txt"
Content-Transfer-Encoding: base64

aTJjOjEtMDAyMi0taTJjOjEtMDAzYgppMmM6MS0wMDIyLS1wbGF0Zm9ybTpyZWd1bGF0b3It
MwppMmM6MS0wMDNiLS1wbGF0Zm9ybTozMDIwMDAwMC5kc3MKcGh5OnBoeS0xMDQwNDQucGh5
LjAtLXBsYXRmb3JtOjgwMDAwMDAuZXRoZXJuZXQKcGh5OnBoeS0xMDQwNDQucGh5LjEtLXBs
YXRmb3JtOjgwMDAwMDAuZXRoZXJuZXQKcGxhdGZvcm06MzEwMDAwMDAudXNiLS1pMmM6MC0w
MDNmCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjEwODJlMC5jbG9jay1jb250cm9sbGVyCnBsYXRmb3JtOjQ0MDQzMDAw
LnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjEwODJlNC5j
bG9jay1jb250cm9sbGVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNs
b2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjIwMDAwMDAwLmkyYwpwbGF0Zm9ybTo0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToyMDAxMDAw
MC5pMmMKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJv
bGxlci0tcGxhdGZvcm06MjAwMjAwMDAuaTJjCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1j
b250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0MDAwMDAudGltZXIKcGxh
dGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxh
dGZvcm06MjQxMDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDIwMDAwLnRpbWVyCnBsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0
MzAwMDAudGltZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2st
Y29udHJvbGxlci0tcGxhdGZvcm06MjQ0MDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDUwMDAwLnRp
bWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjI0NjAwMDAudGltZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNv
bnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06MjQ3MDAwMC50aW1lcgpwbGF0
Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0
Zm9ybToyODAwMDAwLnNlcmlhbApwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToyYjEwMDAwLmF1ZGlvLWNvbnRyb2xsZXIK
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0t
cGxhdGZvcm06MmIxZjAwMDAucnRjCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9s
bGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjJiMzAwMDUwLnRhcmdldC1tb2R1bGUK
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0t
cGxhdGZvcm06MzAyMDAwMDAuZHNzCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9s
bGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjYwMDAwMC5ncGlvCnBsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjYw
MTAwMC5ncGlvCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNv
bnRyb2xsZXItLXBsYXRmb3JtOjgwMDAwMDAuZXRoZXJuZXQKcGxhdGZvcm06NDQwNDMwMDAu
c3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06ODAwMGYwMC5t
ZGlvCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOmUwMDAwMDAud2F0Y2hkb2cKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06ZTAxMDAwMC53YXRjaGRv
ZwpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVy
LS1wbGF0Zm9ybTplMDIwMDAwLndhdGNoZG9nCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1j
b250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOmUwMzAwMDAud2F0Y2hkb2cK
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0t
cGxhdGZvcm06ZTBmMDAwMC53YXRjaGRvZwpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29u
dHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybTpmOTAwMDAwLmR3YzMtdXNiCnBs
YXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBs
YXRmb3JtOmY5MTAwMDAuZHdjMy11c2IKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRy
b2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06ZmEwMDAwMC5tbWMKcGxhdGZvcm06
NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06
ZmExMDAwMC5tbWMKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2st
Y29udHJvbGxlci0tcGxhdGZvcm06ZmM0MDAwMC5zcGkKcGxhdGZvcm06NDQwNDMwMDAuc3lz
dGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06ZmQwMDAwMC5ncHUK
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0t
cGxhdGZvcm06MjAwMDAwMDAuaTJjCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9s
bGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjIwMDEwMDAwLmkyYwpwbGF0Zm9ybTo0
NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybToy
MDAyMDAwMC5pMmMKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXIt
Y29udHJvbGxlci0tcGxhdGZvcm06MjQwMDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDEwMDAwLnRp
bWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjI0MjAwMDAudGltZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNv
bnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjQzMDAwMC50aW1lcgpwbGF0
Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0
Zm9ybToyNDQwMDAwLnRpbWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVy
OnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0NTAwMDAudGltZXIKcGxhdGZvcm06NDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjQ2
MDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1j
b250cm9sbGVyLS1wbGF0Zm9ybToyNDcwMDAwLnRpbWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5
c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI4MDAwMDAuc2Vy
aWFsCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjJiMTAwMDAuYXVkaW8tY29udHJvbGxlcgpwbGF0Zm9ybTo0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybToyYjFmMDAw
MC5ydGMKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJv
bGxlci0tcGxhdGZvcm06MmIzMDAwNTAudGFyZ2V0LW1vZHVsZQpwbGF0Zm9ybTo0NDA0MzAw
MC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTozMDIwMDAw
MC5kc3MKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJv
bGxlci0tcGxhdGZvcm06NjAwMDAwLmdwaW8KcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNv
bnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06NjAxMDAwLmdwaW8KcGxhdGZv
cm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZv
cm06ODAwMDAwMC5ldGhlcm5ldApwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTpiMDAwMDAudGVtcGVyYXR1cmUtc2Vuc29y
CnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXIt
LXBsYXRmb3JtOmUwMDAwMDAud2F0Y2hkb2cKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNv
bnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06ZTAxMDAwMC53YXRjaGRvZwpw
bGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1w
bGF0Zm9ybTplMDIwMDAwLndhdGNoZG9nCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250
cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOmUwMzAwMDAud2F0Y2hkb2cKcGxh
dGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxh
dGZvcm06ZTBmMDAwMC53YXRjaGRvZwpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJv
bGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTpmOTAwMDAwLmR3YzMtdXNiCnBsYXRm
b3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRm
b3JtOmY5MTAwMDAuZHdjMy11c2IKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xs
ZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06ZmEwMDAwMC5tbWMKcGxhdGZvcm06NDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06ZmEx
MDAwMC5tbWMKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29u
dHJvbGxlci0tcGxhdGZvcm06ZmM0MDAwMC5zcGkKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06ZmQwMDAwMC5ncHUKcGxh
dGZvcm06NDgwMDAwMDAuaW50ZXJydXB0LWNvbnRyb2xsZXItLXBsYXRmb3JtOjQ4NWMwMDAw
LmRtYS1jb250cm9sbGVyCnBsYXRmb3JtOjQ4MDAwMDAwLmludGVycnVwdC1jb250cm9sbGVy
LS1wbGF0Zm9ybTo0ODVjMDEwMC5kbWEtY29udHJvbGxlcgpwbGF0Zm9ybTo0ZDAwMDAwMC5t
YWlsYm94LS1wbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcgpwbGF0Zm9ybTo2
MDAwMDAuZ3Bpby0tcGxhdGZvcm06cmVndWxhdG9yLTQKcGxhdGZvcm06NjAxMDAwLmdwaW8t
LWkyYzoxLTAwMjIKcGxhdGZvcm06YnVzQGYwMDAwLS1wbGF0Zm9ybTozMTAwMDAwMC51c2IK
cGxhdGZvcm06YnVzQGYwMDAwLS1wbGF0Zm9ybTozMTEwMDAwMC51c2IKcGxhdGZvcm06YnVz
QGYwMDAwOmludGVycnVwdC1jb250cm9sbGVyQGEwMDAwMC0tcGxhdGZvcm06NjAwMDAwLmdw
aW8KcGxhdGZvcm06YnVzQGYwMDAwOmludGVycnVwdC1jb250cm9sbGVyQGEwMDAwMC0tcGxh
dGZvcm06NjAxMDAwLmdwaW8KcGxhdGZvcm06ZjQwMDAucGluY3RybC0taTJjOjEtMDAyMgpw
bGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybToyMDAwMDAwMC5pMmMKcGxhdGZvcm06
ZjQwMDAucGluY3RybC0tcGxhdGZvcm06MjAwMTAwMDAuaTJjCnBsYXRmb3JtOmY0MDAwLnBp
bmN0cmwtLXBsYXRmb3JtOjIwMDIwMDAwLmkyYwpwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1w
bGF0Zm9ybToyODAwMDAwLnNlcmlhbApwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9y
bToyYjEwMDAwLmF1ZGlvLWNvbnRyb2xsZXIKcGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxh
dGZvcm06MzAyMDAwMDAuZHNzCnBsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3JtOjMx
MTAwMDAwLnVzYgpwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTo4MDAwMDAwLmV0
aGVybmV0CnBsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3JtOjgwMDBmMDAubWRpbwpw
bGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTpmYTAwMDAwLm1tYwpwbGF0Zm9ybTpm
NDAwMC5waW5jdHJsLS1wbGF0Zm9ybTpmYTEwMDAwLm1tYwpwbGF0Zm9ybTpmNDAwMC5waW5j
dHJsLS1wbGF0Zm9ybTpmYzQwMDAwLnNwaQpwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0
Zm9ybTpsZWRzCnBsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3JtOnJlZ3VsYXRvci00
CnBsYXRmb3JtOnJlZ3VsYXRvci0wLS1wbGF0Zm9ybTpyZWd1bGF0b3ItMQpwbGF0Zm9ybTpy
ZWd1bGF0b3ItMC0tcGxhdGZvcm06cmVndWxhdG9yLTIKcGxhdGZvcm06cmVndWxhdG9yLTEt
LXBsYXRmb3JtOnJlZ3VsYXRvci00CnBsYXRmb3JtOnJlZ3VsYXRvci0yLS1pMmM6MS0wMDFi
CnBsYXRmb3JtOnJlZ3VsYXRvci0yLS1wbGF0Zm9ybTpyZWd1bGF0b3ItMwpwbGF0Zm9ybTpy
ZWd1bGF0b3ItMi0tcGxhdGZvcm06cmVndWxhdG9yLTUKcGxhdGZvcm06cmVndWxhdG9yLTMt
LXBsYXRmb3JtOmZhMDAwMDAubW1jCnBsYXRmb3JtOnJlZ3VsYXRvci00LS1wbGF0Zm9ybTpm
YTAwMDAwLm1tYwpwbGF0Zm9ybTpyZWd1bGF0b3ItNS0taTJjOjEtMDAxYgpyZWd1bGF0b3I6
cmVndWxhdG9yLjAtLWkyYzoxLTAwMjIKcmVndWxhdG9yOnJlZ3VsYXRvci4wLS1pMmM6MS0w
MDNiCg==
--------------oyD0P5rhgVTVdKLZEq360Ft8
Content-Type: text/plain; charset=UTF-8; name="devlink-fixed.txt"
Content-Disposition: attachment; filename="devlink-fixed.txt"
Content-Transfer-Encoding: base64

aTJjOjEtMDAyMi0tcGxhdGZvcm06cmVndWxhdG9yLTMKaTJjOjEtMDAzYi0tcGxhdGZvcm06
MzAyMDAwMDAuZHNzCnBoeTpwaHktMTA0MDQ0LnBoeS4wLS1wbGF0Zm9ybTo4MDAwMDAwLmV0
aGVybmV0CnBoeTpwaHktMTA0MDQ0LnBoeS4xLS1wbGF0Zm9ybTo4MDAwMDAwLmV0aGVybmV0
CnBsYXRmb3JtOjMxMDAwMDAwLnVzYi0taTJjOjAtMDAzZgpwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToxMDgyZTAuY2xv
Y2stY29udHJvbGxlcgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9j
ay1jb250cm9sbGVyLS1wbGF0Zm9ybToxMDgyZTQuY2xvY2stY29udHJvbGxlcgpwbGF0Zm9y
bTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9y
bToyMDAwMDAwMC5pMmMKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xv
Y2stY29udHJvbGxlci0tcGxhdGZvcm06MjAwMTAwMDAuaTJjCnBsYXRmb3JtOjQ0MDQzMDAw
LnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjIwMDIwMDAw
LmkyYwpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9s
bGVyLS1wbGF0Zm9ybToyNDAwMDAwLnRpbWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1j
b250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0MTAwMDAudGltZXIKcGxh
dGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxh
dGZvcm06MjQyMDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDMwMDAwLnRpbWVyCnBsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0
NDAwMDAudGltZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2st
Y29udHJvbGxlci0tcGxhdGZvcm06MjQ1MDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDYwMDAwLnRp
bWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjI0NzAwMDAudGltZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNv
bnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06MjgwMDAwMC5zZXJpYWwKcGxh
dGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxh
dGZvcm06MmIxMDAwMC5hdWRpby1jb250cm9sbGVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjJiMWYwMDAwLnJ0Ywpw
bGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1w
bGF0Zm9ybToyYjMwMDA1MC50YXJnZXQtbW9kdWxlCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOjMwMjAwMDAwLmRzcwpw
bGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1w
bGF0Zm9ybTo2MDAwMDAuZ3BpbwpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxl
cjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybTo2MDEwMDAuZ3BpbwpwbGF0Zm9ybTo0NDA0
MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybTo4MDAw
MDAwLmV0aGVybmV0CnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2Nr
LWNvbnRyb2xsZXItLXBsYXRmb3JtOjgwMDBmMDAubWRpbwpwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybTplMDAwMDAwLndh
dGNoZG9nCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRy
b2xsZXItLXBsYXRmb3JtOmUwMTAwMDAud2F0Y2hkb2cKcGxhdGZvcm06NDQwNDMwMDAuc3lz
dGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxlci0tcGxhdGZvcm06ZTAyMDAwMC53YXRj
aGRvZwpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpjbG9jay1jb250cm9s
bGVyLS1wbGF0Zm9ybTplMDMwMDAwLndhdGNoZG9nCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOmUwZjAwMDAud2F0Y2hk
b2cKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6Y2xvY2stY29udHJvbGxl
ci0tcGxhdGZvcm06ZjkwMDAwMC5kd2MzLXVzYgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0t
Y29udHJvbGxlcjpjbG9jay1jb250cm9sbGVyLS1wbGF0Zm9ybTpmOTEwMDAwLmR3YzMtdXNi
CnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXIt
LXBsYXRmb3JtOmZhMDAwMDAubW1jCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9s
bGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZhMTAwMDAubW1jCnBsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZj
NDAwMDAuc3BpCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOmNsb2NrLWNv
bnRyb2xsZXItLXBsYXRmb3JtOmZkMDAwMDAuZ3B1CnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3Rl
bS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjIwMDAwMDAwLmkyYwpw
bGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1w
bGF0Zm9ybToyMDAxMDAwMC5pMmMKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xs
ZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjAwMjAwMDAuaTJjCnBsYXRmb3JtOjQ0
MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0
MDAwMDAudGltZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXIt
Y29udHJvbGxlci0tcGxhdGZvcm06MjQxMDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybToyNDIwMDAwLnRp
bWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjI0MzAwMDAudGltZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNv
bnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjQ0MDAwMC50aW1lcgpwbGF0
Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0
Zm9ybToyNDUwMDAwLnRpbWVyCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVy
OnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjI0NjAwMDAudGltZXIKcGxhdGZvcm06NDQw
NDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06MjQ3
MDAwMC50aW1lcgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1j
b250cm9sbGVyLS1wbGF0Zm9ybToyODAwMDAwLnNlcmlhbApwbGF0Zm9ybTo0NDA0MzAwMC5z
eXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybToyYjEwMDAwLmF1
ZGlvLWNvbnRyb2xsZXIKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93
ZXItY29udHJvbGxlci0tcGxhdGZvcm06MmIxZjAwMDAucnRjCnBsYXRmb3JtOjQ0MDQzMDAw
LnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjJiMzAwMDUw
LnRhcmdldC1tb2R1bGUKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93
ZXItY29udHJvbGxlci0tcGxhdGZvcm06MzAyMDAwMDAuZHNzCnBsYXRmb3JtOjQ0MDQzMDAw
LnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjYwMDAwMC5n
cGlvCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOjYwMTAwMC5ncGlvCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250
cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOjgwMDAwMDAuZXRoZXJuZXQKcGxh
dGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxh
dGZvcm06YjAwMDAwLnRlbXBlcmF0dXJlLXNlbnNvcgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0
ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTplMDAwMDAwLndhdGNo
ZG9nCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xs
ZXItLXBsYXRmb3JtOmUwMTAwMDAud2F0Y2hkb2cKcGxhdGZvcm06NDQwNDMwMDAuc3lzdGVt
LWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0tcGxhdGZvcm06ZTAyMDAwMC53YXRjaGRv
ZwpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29udHJvbGxlcjpwb3dlci1jb250cm9sbGVy
LS1wbGF0Zm9ybTplMDMwMDAwLndhdGNoZG9nCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1j
b250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOmUwZjAwMDAud2F0Y2hkb2cK
cGxhdGZvcm06NDQwNDMwMDAuc3lzdGVtLWNvbnRyb2xsZXI6cG93ZXItY29udHJvbGxlci0t
cGxhdGZvcm06ZjkwMDAwMC5kd2MzLXVzYgpwbGF0Zm9ybTo0NDA0MzAwMC5zeXN0ZW0tY29u
dHJvbGxlcjpwb3dlci1jb250cm9sbGVyLS1wbGF0Zm9ybTpmOTEwMDAwLmR3YzMtdXNiCnBs
YXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBs
YXRmb3JtOmZhMDAwMDAubW1jCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVy
OnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZhMTAwMDAubW1jCnBsYXRmb3JtOjQ0MDQz
MDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRyb2xsZXItLXBsYXRmb3JtOmZjNDAw
MDAuc3BpCnBsYXRmb3JtOjQ0MDQzMDAwLnN5c3RlbS1jb250cm9sbGVyOnBvd2VyLWNvbnRy
b2xsZXItLXBsYXRmb3JtOmZkMDAwMDAuZ3B1CnBsYXRmb3JtOjQ4MDAwMDAwLmludGVycnVw
dC1jb250cm9sbGVyLS1wbGF0Zm9ybTo0ODVjMDAwMC5kbWEtY29udHJvbGxlcgpwbGF0Zm9y
bTo0ODAwMDAwMC5pbnRlcnJ1cHQtY29udHJvbGxlci0tcGxhdGZvcm06NDg1YzAxMDAuZG1h
LWNvbnRyb2xsZXIKcGxhdGZvcm06NGQwMDAwMDAubWFpbGJveC0tcGxhdGZvcm06NDQwNDMw
MDAuc3lzdGVtLWNvbnRyb2xsZXIKcGxhdGZvcm06NjAwMDAwLmdwaW8tLXBsYXRmb3JtOnJl
Z3VsYXRvci00CnBsYXRmb3JtOjYwMTAwMC5ncGlvLS1pMmM6MS0wMDIyCnBsYXRmb3JtOmJ1
c0BmMDAwMC0tcGxhdGZvcm06MzEwMDAwMDAudXNiCnBsYXRmb3JtOmJ1c0BmMDAwMC0tcGxh
dGZvcm06MzExMDAwMDAudXNiCnBsYXRmb3JtOmJ1c0BmMDAwMDppbnRlcnJ1cHQtY29udHJv
bGxlckBhMDAwMDAtLXBsYXRmb3JtOjYwMDAwMC5ncGlvCnBsYXRmb3JtOmJ1c0BmMDAwMDpp
bnRlcnJ1cHQtY29udHJvbGxlckBhMDAwMDAtLXBsYXRmb3JtOjYwMTAwMC5ncGlvCnBsYXRm
b3JtOmY0MDAwLnBpbmN0cmwtLWkyYzoxLTAwMjIKcGxhdGZvcm06ZjQwMDAucGluY3RybC0t
cGxhdGZvcm06MjAwMDAwMDAuaTJjCnBsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3Jt
OjIwMDEwMDAwLmkyYwpwbGF0Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybToyMDAyMDAw
MC5pMmMKcGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxhdGZvcm06MjgwMDAwMC5zZXJpYWwK
cGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxhdGZvcm06MmIxMDAwMC5hdWRpby1jb250cm9s
bGVyCnBsYXRmb3JtOmY0MDAwLnBpbmN0cmwtLXBsYXRmb3JtOjMwMjAwMDAwLmRzcwpwbGF0
Zm9ybTpmNDAwMC5waW5jdHJsLS1wbGF0Zm9ybTozMTEwMDAwMC51c2IKcGxhdGZvcm06ZjQw
MDAucGluY3RybC0tcGxhdGZvcm06ODAwMDAwMC5ldGhlcm5ldApwbGF0Zm9ybTpmNDAwMC5w
aW5jdHJsLS1wbGF0Zm9ybTo4MDAwZjAwLm1kaW8KcGxhdGZvcm06ZjQwMDAucGluY3RybC0t
cGxhdGZvcm06ZmEwMDAwMC5tbWMKcGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxhdGZvcm06
ZmExMDAwMC5tbWMKcGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxhdGZvcm06ZmM0MDAwMC5z
cGkKcGxhdGZvcm06ZjQwMDAucGluY3RybC0tcGxhdGZvcm06bGVkcwpwbGF0Zm9ybTpmNDAw
MC5waW5jdHJsLS1wbGF0Zm9ybTpyZWd1bGF0b3ItNApwbGF0Zm9ybTpyZWd1bGF0b3ItMC0t
cGxhdGZvcm06cmVndWxhdG9yLTEKcGxhdGZvcm06cmVndWxhdG9yLTAtLXBsYXRmb3JtOnJl
Z3VsYXRvci0yCnBsYXRmb3JtOnJlZ3VsYXRvci0xLS1wbGF0Zm9ybTpyZWd1bGF0b3ItNApw
bGF0Zm9ybTpyZWd1bGF0b3ItMi0taTJjOjEtMDAxYgpwbGF0Zm9ybTpyZWd1bGF0b3ItMi0t
cGxhdGZvcm06cmVndWxhdG9yLTMKcGxhdGZvcm06cmVndWxhdG9yLTItLXBsYXRmb3JtOnJl
Z3VsYXRvci01CnBsYXRmb3JtOnJlZ3VsYXRvci0zLS1wbGF0Zm9ybTpmYTAwMDAwLm1tYwpw
bGF0Zm9ybTpyZWd1bGF0b3ItNC0tcGxhdGZvcm06ZmEwMDAwMC5tbWMKcGxhdGZvcm06cmVn
dWxhdG9yLTUtLWkyYzoxLTAwMWIKcmVndWxhdG9yOnJlZ3VsYXRvci4wLS1pMmM6MS0wMDIy
CnJlZ3VsYXRvcjpyZWd1bGF0b3IuMC0taTJjOjEtMDAzYgo=

--------------oyD0P5rhgVTVdKLZEq360Ft8--
