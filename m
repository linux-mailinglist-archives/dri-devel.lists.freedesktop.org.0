Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920E62921F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 08:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF91610E0A6;
	Tue, 15 Nov 2022 07:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D24E10E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1668495916; bh=hlDIZ/h0Jfj0ZKQ748nP+iNUuwLrqEYEA2SJO/GQyAw=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=ZVjS8lu3ulciOo1exeQrSw5BRrA87Y2EnaXEb047bFu/R4D1nLD2ftL/ghBnvbaHN
 jOre3lOdppVP/raaDspV1RFRal+ELqQqABvjXiAAYH2BIUhwnOsWP6boLe/6abcLFu
 mLdjtLtkjMdrYK5yvQEUNXBKE0bW77ytHWva9QsUav1c5KRCsWHFII9MnkXeq26YPs
 npX/M2y1DycxPd3xKfK6NabaqHHWSNaiAACodaDVTx3YB/v3FZux9kn1fzlKEb1COM
 JN1oBIetaQkS1HQbsUTsessJLou7jxGWxjlq6w1HpKqGB/6Glg3UeZxnAN0IBZhZUv
 DpT+6gzp4QSjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.131.87]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMGRK-1odrNy2euc-00JJaX; Tue, 15
 Nov 2022 08:05:16 +0100
Message-ID: <2d79ad8e-45b7-d095-8f26-4f2e8aba66f7@gmx.de>
Date: Tue, 15 Nov 2022 08:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH -next] fbdev: via: Fix section mismatch warning in
 via_core_init()
Content-Language: en-US
To: shangxiaojing <shangxiaojing@huawei.com>, FlorianSchandinat@gmx.de,
 corbet@lwn.net, sfr@canb.auug.org.au, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20221115025306.2602-1-shangxiaojing@huawei.com>
 <156a9800-b40a-8e83-86d2-27f9e2e67523@gmx.de>
 <1e9e04d2-29b4-6e37-fa5f-f0f4b767171b@huawei.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <1e9e04d2-29b4-6e37-fa5f-f0f4b767171b@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sbur/NhrBVuVUnsRRjbywTXb/1EQlaPiVduPwOVaB2lHHdxl2nz
 11gaClbj3W/wuMzMBznaKo5Qdti/+huk3COGDi9n5wBgSPi/LgWnmBD6ImA3pdFWyynf9Ad
 QE0AVwAD6/t4/wTf3ZXEVqVHrxaeqyd5+8fxb/iUn9b0xaP2Ty7bd8sKMkpGTTTTwG5g/Fc
 G+amZGux+S/nTeEttY7+A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AY/tA/ZR5Hk=;XqODsCIdi62WswIREzP2GbF3hjV
 fi/MYQBpmuaQLq2ETzmioI8HeZ/iCy/zQ0NHZQxSItLcXbPvV3z5bIUsPgKFS5O1NmOXME3A1
 fnaLnhOsD0/tq/GjpLwxjrQv8hLbjkbCl73fL/FC+RjbqgbyY/Gt3/j1InsRLoRhjikfTWEb1
 A47KuE0M+0egl6jNEacHlTUiJCVKWw75wYBINjlXnG3WN5hh89H31CDzu0/dbdEa0DrzBOBVf
 IHvww83S3pzAx4JfgKqmqST+uUtO+iQqbI5g1vGZmu5X6tsUFR9orgEDgPBxZuyt/u9noaRsx
 3s0NxYAaFvWgX2PiqhQW33Yoc9obQavsx+C4oT9k6kJDVnN8f6Z61wNioOxQnmpJlojPw9BmE
 t0ErEfloWEWA3iN1C9ooS18K6ThN39lZGRhJfAzJBgUPZljbx4m5VfWJvmj90p7F03qPWQ6qU
 yDG/XUuG23cJSLAiR0xXT35F1eFwVdrS4IJSXWGRDj01KKNgaEwWi4lwwK6Cj3U0SycJuPfCE
 PFmUVMS4JvJqokxUPGRF2XFIlmCxYdgMC+aEKXS3hYFf6ptc/973+4tNx8JpE0paAC+Ea2/CU
 zm2ZBT8wJyxlFPmotmqBlue8/dtOVwENECQMeVh23CI5U/09jN5gZv8P9TRPsmtPFqtuzWdS7
 r7iUQhiMqmnE3w1teTUEeX4o9gu8D3ExZdBMJxpvAnPFwHyL4mWqDxmOQlEePSZ+T9P+x4MeT
 tMJIRwdlgTt7R/h9QnSrWS2uiN6Bfbd+4LMIjzzyztY2KseNr5m/wFmZLx8VXfIscq5/3BhUV
 oJt7DreJDoLHIGkz4KmvsEQxL5QYxqPDYMJuIL4/nhMvPg4H6zS23ZdjTLfvTlkp9nPEk6fiP
 c+MYkbdLcXq9uCa7TzPxSEqPSL9o6WxVJtJOYTGH9nG0gsNi1TVTbc4sjUlnb9looHrmQMixM
 yGKCf3AA8TwLaL7hhoSU1RDS62M=
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

On 11/15/22 07:52, shangxiaojing wrote:
>
>
> On 2022/11/15 13:14, Helge Deller wrote:
>> On 11/15/22 03:53, Shang XiaoJing wrote:
>>> Due to viafb_exit() with "__exit" tag, it should not be called by the
>>> __init function via_core_init().
>>
>> I wonder if you can't instead of this and your previous patch (ab885d8c=
7e15)
>> turn the i2c and gpio drivers to proper platform drivers, e.g.
>> adding to bottom of via/via_i2c.c:
>> module_platform_driver(&via_i2c_driver)
>> instead of viafb_i2c_init() and viafb_i2c_exit().
>>
>> Shouldn't they then automatically be loaded/unloaded?
>>
>
> I'm sorry that I have no idea how to change an i2c driver to a platform =
driver.
>
> As for module_platform_driver(), I have checked and it looks like just a=
 helper macro to definite XXX_init() and XXX_exit() instead of automatical=
ly load/unload the driver.

module_platform_driver() uses module_driver() which adds module_init() whi=
ch then
adds code to call the generated xxx_init() functions at startup and exit.

> Besides, the XXX_init() and XXX_exit() definited by the
> module_platform_driver() can only call
> platform_driver_register()/platform_driver_unregister(), perhaps not
> suitable for via_driver? (or just need to call
> platform_driver_register() after change to platform driver)

platform_driver_register() will be called by the newly generated XXX_init(=
).

Do you have such a viafb card and can try?

Helge
