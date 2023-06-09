Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C9728D56
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 03:54:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C84E10E630;
	Fri,  9 Jun 2023 01:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2410310E62B;
 Fri,  9 Jun 2023 01:54:29 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cxe+pUhoJkZ9YAAA--.2707S3;
 Fri, 09 Jun 2023 09:54:28 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8AxZuRThoJkXW0JAA--.29103S3; 
 Fri, 09 Jun 2023 09:54:28 +0800 (CST)
Message-ID: <5f47425c-69b7-3274-55eb-4551a152c0fe@loongson.cn>
Date: Fri, 9 Jun 2023 09:54:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v3 1/4] PCI/VGA: tidy up the code and comment
 format
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>, Sui Jingfeng <15330273260@189.cn>
References: <20230608190730.GA1209607@bhelgaas>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230608190730.GA1209607@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8AxZuRThoJkXW0JAA--.29103S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7trW8GryUXFy8Gw45ZFy8CrX_yoW8Xw4xp3
 4YkF93Cws3Gr15WryxZr4fXFWfX395J3WUt3W5Wr93AwnxK34kKrsYyan8KFW3Xr9FyF40
 qF4jgr43G3W3uFgCm3ZEXasCq-sJn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUPab4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
 6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
 xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
 6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxG
 rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Wrv_Gr1UMIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUaTa0DU
 UUU
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
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Yi Liu <yi.l.liu@intel.com>,
 kvm@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Kevin Tian <kevin.tian@intel.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, loongson-kernel@lists.loongnix.cn,
 Alex Williamson <alex.williamson@redhat.com>,
 Abhishek Sahu <abhsahu@nvidia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Li Yi <liyi@loongson.cn>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/9 03:07, Bjorn Helgaas wrote:
> Capitalize subject to match ("Tidy ...")
>
> On Thu, Jun 08, 2023 at 07:43:19PM +0800, Sui Jingfeng wrote:
>> From: Sui Jingfeng <suijingfeng@loongson.cn>
>>
>> This patch replaces the leading space with a tab and removes the double
>> blank line, no functional change.
> Can you move this to the end of the series?  The functional changes
> are more likely to be backported, and I think the backport may be a
> little easier without the cleanup in the middle.

OK, acceptable.

>>   	/* we could in theory hand out locks on IO and mem
>> -	 * separately to userspace but it can cause deadlocks */
>> +	 * separately to userspace but it can cause deadlocks
>> +	 */
> Since you're touching this anyway, can you update it to the
> conventional multi-line comment style:
>
>    /*
>     * We could in theory ...
>     */
>
> And capitalize "We", add a period at end, and rewrap to fill 78
> columns or so?  Same for other comments below.
OK, I could improve this at next version.
>> +++ b/include/linux/vgaarb.h
>> @@ -23,9 +23,7 @@
>>    * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>    * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>>    * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>> - * DEALINGS
>> - * IN THE SOFTWARE.
>> - *
>> + * DEALINGS IN THE SOFTWARE.
>>    */
> Can you make a separate patch to replace this entire copyright notice
> with the appropriate SPDX-License-Identifier header?
> Documentation/process/license-rules.rst has details.

Wow ...

> Bjorn

-- 
Jingfeng

